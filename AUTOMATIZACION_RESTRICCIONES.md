# Automatización de Verificación de Restricciones

Este documento describe cómo funciona la automatización de verificación de restricciones y cómo usarla.

---

## 🛠️ Herramientas de Automatización

### 1. Scripts de Verificación

#### `scripts/verify-restrictions.js`
Script principal que verifica:
- ✅ Archivo `.env` existe y está en `.gitignore`
- ✅ Variables de entorno requeridas presentes
- ✅ `.gitignore` configurado correctamente
- ✅ No hay secrets en el código
- ✅ Configuración de TypeScript
- ✅ Configuración de ESLint
- ✅ README completo

**Uso:**
```bash
npm run verify
# o
node scripts/verify-restrictions.js
```

#### `scripts/verify-rls.js`
Script que verifica:
- ✅ Archivos de migración SQL existen
- ✅ Estructura de tablas esperadas
- ✅ Políticas RLS en documentación

**Uso:**
```bash
npm run verify:rls
# o
node scripts/verify-rls.js
```

---

### 2. Pre-commit Hooks (Husky)

Los hooks de Git verifican automáticamente antes de cada commit:

#### `.husky/pre-commit`
- ✅ Ejecuta `verify-restrictions.js`
- ✅ Verifica que no hay secrets en archivos staged
- ✅ Verifica que `.env` no se commitea
- ✅ Ejecuta linter (si está configurado)

#### `.husky/commit-msg`
- ✅ Verifica que el mensaje de commit no está vacío
- ✅ Verifica que no contiene secrets
- ✅ Sugiere formato Conventional Commits

**Instalación:**
```bash
npm install
npx husky install
```

---

### 3. GitHub Actions (CI/CD)

#### `.github/workflows/verify-restrictions.yml`

Se ejecuta automáticamente en:
- Push a `main` o `develop`
- Pull Requests a `main` o `develop`

**Verifica:**
- ✅ Restricciones del proyecto
- ✅ RLS policies
- ✅ Secrets en código (usando TruffleHog)
- ✅ ESLint
- ✅ TypeScript
- ✅ Security audit de dependencias

---

### 4. ESLint Rules Personalizadas

#### `.eslintrc.restrictions.js`

Reglas específicas para verificar restricciones:
- No secrets en código
- No `any` en TypeScript
- Prefer `const` sobre `let`
- No catch blocks vacíos
- Funciones pequeñas
- No código duplicado
- Desuscribirse de observables (Angular)
- No innerHTML sin sanitización

**Integración:**
Agregar estas reglas a `iyf_backend_2026/.eslintrc.json`:

```json
{
  "extends": ["../../.eslintrc.restrictions.js"],
  ...
}
```

---

## 📋 Checklist de Configuración

### Paso 1: Instalar Dependencias
```bash
# En la raíz del proyecto
npm install

# En iyf_backend_2026
cd iyf_backend_2026
npm install
```

### Paso 2: Configurar Husky
```bash
# En la raíz del proyecto
npx husky install
npx husky add .husky/pre-commit "npm run verify"
```

### Paso 3: Hacer Ejecutables los Scripts
```bash
chmod +x scripts/verify-restrictions.js
chmod +x scripts/verify-rls.js
chmod +x .husky/pre-commit
chmod +x .husky/commit-msg
```

### Paso 4: Verificar que Funciona
```bash
# Verificar restricciones manualmente
npm run verify

# Intentar commit (debe ejecutar hooks)
git add .
git commit -m "test: verify hooks work"
```

---

## 🚀 Uso Diario

### Antes de Hacer Commit
Los hooks se ejecutan automáticamente. Si fallan:
1. Revisa los errores mostrados
2. Corrige los problemas
3. Intenta commitear de nuevo

### Verificación Manual
```bash
# Verificar todas las restricciones
npm run verify:all

# Solo restricciones generales
npm run verify

# Solo RLS
npm run verify:rls
```

### En CI/CD
Las verificaciones se ejecutan automáticamente en cada PR. Revisa los resultados en la pestaña "Actions" de GitHub.

---

## 🔧 Personalización

### Agregar Nuevas Verificaciones

Edita `scripts/verify-restrictions.js` y agrega nuevas funciones:

```javascript
function checkNuevaRestriccion() {
  logInfo('Verificando nueva restricción...');
  // Tu lógica aquí
  if (condicion) {
    logSuccess('Nueva restricción cumplida');
    return true;
  } else {
    logError('Nueva restricción falló');
    return false;
  }
}
```

Luego agrega la función al array `checks` en `main()`.

### Modificar Reglas de ESLint

Edita `.eslintrc.restrictions.js` para agregar o modificar reglas.

### Modificar GitHub Actions

Edita `.github/workflows/verify-restrictions.yml` para agregar nuevos checks.

---

## 📊 Interpretación de Resultados

### ✅ PASS
La verificación pasó correctamente.

### ⚠️ WARNING
Hay advertencias pero no bloquean. Revisa y corrige cuando sea posible.

### ❌ ERROR
La verificación falló. Debes corregir antes de continuar.

---

## 🐛 Troubleshooting

### Los hooks no se ejecutan
```bash
# Reinstalar Husky
rm -rf .husky
npx husky install
npx husky add .husky/pre-commit "npm run verify"
```

### Scripts no son ejecutables
```bash
chmod +x scripts/*.js
chmod +x .husky/*
```

### GitHub Actions no se ejecutan
- Verifica que el archivo está en `.github/workflows/`
- Verifica que el branch tiene el workflow
- Revisa los logs en GitHub Actions

### ESLint no encuentra reglas
```bash
# Instalar plugins necesarios
cd iyf_backend_2026
npm install --save-dev eslint-plugin-no-secrets
npm install --save-dev eslint-plugin-no-unsanitized
```

---

## 📝 Notas Importantes

1. **Los hooks bloquean commits** si encuentran errores críticos
2. **GitHub Actions no bloquean merges** por defecto (configurar branch protection)
3. **Los scripts son verificaciones básicas** - no reemplazan code review manual
4. **RLS verification** requiere Supabase configurado para verificación completa

---

## 🔄 Actualización Continua

Las verificaciones deben actualizarse cuando:
- Se agregan nuevas restricciones a `restriction.md`
- Se cambian tecnologías o herramientas
- Se identifican nuevos patrones de problemas

---

**Última actualización**: 2026

