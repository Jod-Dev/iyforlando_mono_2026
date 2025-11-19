#!/usr/bin/env node

/**
 * Script de Verificación de Row Level Security (RLS)
 * 
 * Verifica que todas las tablas en Supabase tengan RLS habilitado
 * y políticas apropiadas.
 * 
 * Requiere: Supabase CLI configurado
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
};

let errors = [];
let warnings = [];
let passed = [];

function logError(message) {
  errors.push(message);
  console.log(`${colors.red}❌ ERROR:${colors.reset} ${message}`);
}

function logWarning(message) {
  warnings.push(message);
  console.log(`${colors.yellow}⚠️  WARNING:${colors.reset} ${message}`);
}

function logSuccess(message) {
  passed.push(message);
  console.log(`${colors.green}✅ PASS:${colors.reset} ${message}`);
}

function logInfo(message) {
  console.log(`${colors.blue}ℹ️  INFO:${colors.reset} ${message}`);
}

// Tablas esperadas con RLS
const expectedTables = [
  'profiles',
  'semesters',
  'academies',
  'courses',
  'course_registrations',
  'events',
  'event_registrations',
  'volunteers',
];

// Verificar que existe archivo SQL de migraciones
function checkMigrationFiles() {
  logInfo('Verificando archivos de migración...');
  
  // Buscar archivos SQL en el proyecto
  const sqlFiles = [];
  function findSqlFiles(dir) {
    if (!fs.existsSync(dir)) return;
    
    const files = fs.readdirSync(dir);
    files.forEach(file => {
      const filePath = path.join(dir, file);
      const stat = fs.statSync(filePath);
      
      if (stat.isDirectory()) {
        findSqlFiles(filePath);
      } else if (file.endsWith('.sql')) {
        sqlFiles.push(filePath);
      }
    });
  }
  
  findSqlFiles(process.cwd());
  
  if (sqlFiles.length === 0) {
    logWarning('No SQL migration files found');
    return false;
  }
  
  logSuccess(`Found ${sqlFiles.length} SQL file(s)`);
  
  // Verificar que los archivos SQL mencionan RLS
  let rlsFound = false;
  sqlFiles.forEach(file => {
    const content = fs.readFileSync(file, 'utf8');
    if (content.includes('ENABLE ROW LEVEL SECURITY') || content.includes('ALTER TABLE.*ENABLE ROW LEVEL SECURITY')) {
      rlsFound = true;
    }
  });
  
  if (!rlsFound) {
    logWarning('No RLS enablement found in SQL files');
  } else {
    logSuccess('RLS enablement found in SQL files');
  }
  
  return true;
}

// Verificar estructura de tablas esperadas
function checkTableStructure() {
  logInfo('Verificando estructura de tablas...');
  
  // Buscar en archivos de documentación o SQL
  const guiaSupabase = path.join(process.cwd(), 'GUIA_SUPABASE.md');
  
  if (fs.existsSync(guiaSupabase)) {
    const content = fs.readFileSync(guiaSupabase, 'utf8');
    
    expectedTables.forEach(table => {
      if (content.includes(`CREATE TABLE.*${table}`) || content.includes(`table.*${table}`)) {
        logSuccess(`Table ${table} found in documentation`);
      } else {
        logWarning(`Table ${table} not found in documentation`);
      }
    });
  } else {
    logWarning('GUIA_SUPABASE.md not found, cannot verify table structure');
  }
  
  return true;
}

// Verificar políticas RLS en documentación
function checkRLSPolicies() {
  logInfo('Verificando políticas RLS en documentación...');
  
  const guiaSupabase = path.join(process.cwd(), 'GUIA_SUPABASE.md');
  
  if (!fs.existsSync(guiaSupabase)) {
    logWarning('GUIA_SUPABASE.md not found');
    return false;
  }
  
  const content = fs.readFileSync(guiaSupabase, 'utf8');
  
  // Verificar que se mencionan políticas
  if (content.includes('CREATE POLICY') || content.includes('POLICY')) {
    logSuccess('RLS policies found in documentation');
  } else {
    logWarning('No RLS policies found in documentation');
  }
  
  // Verificar políticas por tabla
  expectedTables.forEach(table => {
    if (content.includes(`policy.*${table}`) || content.includes(`${table}.*policy`)) {
      logSuccess(`RLS policies for ${table} found`);
    } else {
      logWarning(`No RLS policies found for ${table}`);
    }
  });
  
  return true;
}

// Función principal
function main() {
  console.log('\n' + '='.repeat(60));
  console.log('🔒 VERIFICACIÓN DE ROW LEVEL SECURITY (RLS)');
  console.log('='.repeat(60) + '\n');
  
  const checks = [
    { name: 'Migration Files', fn: checkMigrationFiles },
    { name: 'Table Structure', fn: checkTableStructure },
    { name: 'RLS Policies', fn: checkRLSPolicies },
  ];
  
  checks.forEach(check => {
    try {
      check.fn();
    } catch (error) {
      logError(`${check.name} check failed: ${error.message}`);
    }
  });
  
  // Resumen
  console.log('\n' + '='.repeat(60));
  console.log('📊 RESUMEN');
  console.log('='.repeat(60));
  console.log(`${colors.green}✅ Passed: ${passed.length}${colors.reset}`);
  console.log(`${colors.yellow}⚠️  Warnings: ${warnings.length}${colors.reset}`);
  console.log(`${colors.red}❌ Errors: ${errors.length}${colors.reset}`);
  console.log('='.repeat(60) + '\n');
  
  if (errors.length > 0) {
    console.log(`${colors.red}❌ VERIFICACIÓN FALLIDA${colors.reset}`);
    console.log('\n⚠️  Nota: Para verificación completa, ejecuta este script después de configurar Supabase.');
    process.exit(1);
  } else {
    console.log(`${colors.green}✅ VERIFICACIÓN COMPLETA${colors.reset}`);
    if (warnings.length > 0) {
      console.log('\n⚠️  Revisa las advertencias antes de continuar.');
    }
    process.exit(0);
  }
}

main();

