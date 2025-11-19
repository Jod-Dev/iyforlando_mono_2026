#!/usr/bin/env node

/**
 * Script de Verificación de Restricciones
 * 
 * Este script verifica automáticamente el cumplimiento de las restricciones
 * definidas en restriction.md
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

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

// Verificaciones

function checkEnvFile() {
  logInfo('Verificando archivo .env...');
  const envPath = path.join(process.cwd(), '.env');
  const envExamplePath = path.join(process.cwd(), '.env.example');
  
  // .env.example debe existir
  if (!fs.existsSync(envExamplePath)) {
    logWarning('.env.example does not exist (should be created)');
  } else {
    logSuccess('.env.example exists');
  }
  
  // .env puede no existir en desarrollo inicial, pero debe estar en .gitignore
  if (!fs.existsSync(envPath)) {
    logWarning('.env file does not exist (create it from .env.example)');
    // No es error crítico si no existe, pero debe estar en .gitignore
  }
  
  if (fs.existsSync(envPath)) {
    const envContent = fs.readFileSync(envPath, 'utf8');
    
    // Verificar que no se commitea .env
    try {
      const gitCheck = execSync('git check-ignore .env', { encoding: 'utf8', stdio: 'pipe' });
      if (!gitCheck.trim()) {
        logError('.env is not in .gitignore');
        return false;
      }
      logSuccess('.env is properly ignored by git');
    } catch (e) {
      logWarning('Could not verify .gitignore (not a git repo?)');
    }
    
    // Verificar variables requeridas
    const requiredVars = ['SUPABASE_URL', 'SUPABASE_ANON_KEY'];
    const missingVars = requiredVars.filter(varName => !envContent.includes(varName));
    
    if (missingVars.length > 0) {
      logError(`Missing required environment variables: ${missingVars.join(', ')}`);
      return false;
    }
    
    logSuccess('Required environment variables present');
  }
  
  return true;
}

function checkGitignore() {
  logInfo('Verificando .gitignore...');
  const gitignorePath = path.join(process.cwd(), '.gitignore');
  
  if (!fs.existsSync(gitignorePath)) {
    logError('.gitignore does not exist');
    return false;
  }
  
  const gitignoreContent = fs.readFileSync(gitignorePath, 'utf8');
  const requiredIgnores = ['.env', 'node_modules', 'dist', '.angular'];
  
  const missingIgnores = requiredIgnores.filter(ignore => !gitignoreContent.includes(ignore));
  
  if (missingIgnores.length > 0) {
    logError(`.gitignore missing: ${missingIgnores.join(', ')}`);
    return false;
  }
  
  logSuccess('.gitignore properly configured');
  return true;
}

function checkSecretsInCode() {
  logInfo('Buscando secrets en el código...');
  
  const patterns = [
    /password\s*[:=]\s*['"][^'"]+['"]/gi,
    /api[_-]?key\s*[:=]\s*['"][^'"]+['"]/gi,
    /secret\s*[:=]\s*['"][^'"]+['"]/gi,
    /token\s*[:=]\s*['"][a-zA-Z0-9]{20,}['"]/gi,
    /supabase.*service.*role.*key/gi,
  ];
  
  // Excepciones: archivos mock o de ejemplo
  const allowedPatterns = [
    /MOCK_SECRET_FOR_DEVELOPMENT_ONLY/gi,
    /your_.*_here/gi,
    /example/gi,
    /TODO/gi,
    /FIXME/gi,
  ];
  
  const srcPath = path.join(process.cwd(), 'iyf_backend_2026', 'src');
  if (!fs.existsSync(srcPath)) {
    logWarning('Source directory not found, skipping secret check');
    return true;
  }
  
  function searchInFile(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const issues = [];
    
    patterns.forEach((pattern, index) => {
      const matches = content.match(pattern);
      if (matches) {
        matches.forEach(match => {
          // Verificar si es una excepción permitida
          const isAllowed = allowedPatterns.some(allowed => allowed.test(match));
          
          // Ignorar si está en comentarios, es un ejemplo, o es mock
          if (!isAllowed && !match.includes('example') && !match.includes('TODO') && 
              !match.includes('FIXME') && !match.includes('MOCK') && 
              !filePath.includes('mock-api') && !filePath.includes('.example')) {
            issues.push({
              file: filePath,
              match: match.substring(0, 50) + '...',
            });
          }
        });
      }
    });
    
    return issues;
  }
  
  function walkDir(dir, fileList = []) {
    const files = fs.readdirSync(dir);
    
    files.forEach(file => {
      const filePath = path.join(dir, file);
      const stat = fs.statSync(filePath);
      
      if (stat.isDirectory() && !file.startsWith('.') && file !== 'node_modules') {
        walkDir(filePath, fileList);
      } else if (file.endsWith('.ts') || file.endsWith('.js')) {
        fileList.push(filePath);
      }
    });
    
    return fileList;
  }
  
  const files = walkDir(srcPath);
  const allIssues = [];
  
  files.forEach(file => {
    const issues = searchInFile(file);
    allIssues.push(...issues);
  });
  
  if (allIssues.length > 0) {
    allIssues.forEach(issue => {
      logError(`Potential secret found in ${issue.file}: ${issue.match}`);
    });
    return false;
  }
  
  logSuccess('No secrets found in code');
  return true;
}

function checkTypeScriptConfig() {
  logInfo('Verificando configuración de TypeScript...');
  const tsconfigPath = path.join(process.cwd(), 'iyf_backend_2026', 'tsconfig.json');
  
  if (!fs.existsSync(tsconfigPath)) {
    logWarning('tsconfig.json not found');
    return true;
  }
  
  try {
    // Leer y limpiar comentarios JSON si existen
    let content = fs.readFileSync(tsconfigPath, 'utf8');
    // Remover comentarios de línea (//)
    content = content.replace(/\/\/.*$/gm, '');
    // Remover comentarios de bloque (/* */)
    content = content.replace(/\/\*[\s\S]*?\*\//g, '');
    
    const tsconfig = JSON.parse(content);
    
    // Verificar que no se permite 'any' implícito
    if (tsconfig.compilerOptions?.noImplicitAny !== true) {
      logWarning('TypeScript noImplicitAny should be enabled');
    } else {
      logSuccess('TypeScript noImplicitAny is enabled');
    }
    
    // Verificar strict mode
    if (tsconfig.compilerOptions?.strict !== true) {
      logWarning('TypeScript strict mode should be enabled');
    } else {
      logSuccess('TypeScript strict mode is enabled');
    }
  } catch (error) {
    logError(`TypeScript config parse error: ${error.message}`);
    return false;
  }
  
  return true;
}

function checkESLintConfig() {
  logInfo('Verificando configuración de ESLint...');
  const eslintPath = path.join(process.cwd(), 'iyf_backend_2026', '.eslintrc.json');
  const eslintJsPath = path.join(process.cwd(), 'iyf_backend_2026', '.eslintrc.js');
  
  if (!fs.existsSync(eslintPath) && !fs.existsSync(eslintJsPath)) {
    logWarning('ESLint config not found');
    return false;
  }
  
  logSuccess('ESLint configuration found');
  return true;
}

function checkReadme() {
  logInfo('Verificando README...');
  const readmePath = path.join(process.cwd(), 'README.md');
  
  if (!fs.existsSync(readmePath)) {
    logError('README.md does not exist');
    return false;
  }
  
  const readmeContent = fs.readFileSync(readmePath, 'utf8');
  const requiredSections = ['descripción', 'description', 'instalación', 'installation', 'requisitos', 'requirements'];
  
  const foundSections = requiredSections.filter(section => 
    readmeContent.toLowerCase().includes(section.toLowerCase())
  );
  
  if (foundSections.length === 0) {
    logWarning('README missing required sections (Description, Installation, Requirements)');
  } else {
    logSuccess('README has required sections');
  }
  
  return true;
}

function checkRestrictionFile() {
  logInfo('Verificando restriction.md...');
  const restrictionPath = path.join(process.cwd(), 'restriction.md');
  
  if (!fs.existsSync(restrictionPath)) {
    logError('restriction.md does not exist');
    return false;
  }
  
  logSuccess('restriction.md exists');
  return true;
}

// Función principal
function main() {
  console.log('\n' + '='.repeat(60));
  console.log('🔍 VERIFICACIÓN DE RESTRICCIONES');
  console.log('='.repeat(60) + '\n');
  
  const checks = [
    { name: 'Restriction File', fn: checkRestrictionFile },
    { name: 'Environment File', fn: checkEnvFile },
    { name: 'Gitignore', fn: checkGitignore },
    { name: 'Secrets in Code', fn: checkSecretsInCode },
    { name: 'TypeScript Config', fn: checkTypeScriptConfig },
    { name: 'ESLint Config', fn: checkESLintConfig },
    { name: 'README', fn: checkReadme },
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
    process.exit(1);
  } else if (warnings.length > 0) {
    console.log(`${colors.yellow}⚠️  VERIFICACIÓN COMPLETA CON ADVERTENCIAS${colors.reset}`);
    process.exit(0);
  } else {
    console.log(`${colors.green}✅ TODAS LAS VERIFICACIONES PASARON${colors.reset}`);
    process.exit(0);
  }
}

main();

