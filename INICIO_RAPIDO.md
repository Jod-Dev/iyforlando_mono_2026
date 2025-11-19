# Inicio Rápido - IYF Orlando 2026

Guía rápida para empezar a desarrollar siguiendo todas las restricciones.

---

## 🚀 Setup Inicial (Una vez)

### 1. Configurar Variables de Entorno

```bash
# Copiar template
cp .env.example .env

# Editar .env y completar con tus valores de Supabase
# SUPABASE_URL=https://tu-proyecto.supabase.co
# SUPABASE_ANON_KEY=tu-anon-key
# SUPABASE_SERVICE_ROLE_KEY=tu-service-role-key (solo para Edge Functions)
```

### 2. Instalar Dependencias

```bash
# En la raíz del proyecto
npm install

# En el frontend
cd iyf_backend_2026
npm install
```

### 3. Configurar Husky (Pre-commit hooks)

```bash
# En la raíz del proyecto
npx husky install
chmod +x .husky/pre-commit
chmod +x .husky/commit-msg
```

### 4. Verificar que Todo Está Configurado

```bash
# En la raíz
npm run verify

# Debe mostrar: ✅ TODAS LAS VERIFICACIONES PASARON
```

---

## 📝 Desarrollo Diario

### Antes de Empezar a Codear

1. **Verificar restricciones aplicables:**
   - Consultar `CHECKLIST_RESTRICCIONES_POR_FASE.md` para tu fase actual
   - Revisar `restriction.md` para restricciones específicas

2. **Crear branch:**
   ```bash
   git checkout -b feat/nombre-de-feature
   ```

### Durante el Desarrollo

1. **Seguir restricciones:**
   - TypeScript strict mode activado
   - No usar `any` sin justificación
   - Validar y sanitizar inputs
   - Manejar errores apropiadamente

2. **Verificar continuamente:**
   ```bash
   # Verificar restricciones
   npm run verify
   
   # Linter
   cd iyf_backend_2026
   npm run lint
   ```

### Antes de Commit

Los hooks se ejecutan automáticamente, pero puedes verificar manualmente:

```bash
# Verificar restricciones
npm run verify

# Si todo pasa, hacer commit
git add .
git commit -m "feat: descripción de la feature"
```

---

## ✅ Checklist Pre-Commit

Antes de cada commit, verificar:

- [ ] Código sigue restricciones de `restriction.md`
- [ ] No hay secrets en el código
- [ ] `.env` no está en staging
- [ ] TypeScript compila sin errores
- [ ] Linter pasa (o warnings justificados)
- [ ] Tests pasan (si existen)
- [ ] Mensaje de commit es descriptivo

---

## 🔍 Verificaciones Automáticas

### Pre-commit Hook
Se ejecuta automáticamente y verifica:
- ✅ Restricciones del proyecto
- ✅ No secrets en código
- ✅ `.env` no se commitea
- ✅ Linter

### GitHub Actions
Se ejecuta en cada push/PR y verifica:
- ✅ Todas las verificaciones de pre-commit
- ✅ Security audit
- ✅ TypeScript compilation
- ✅ Tests (si están configurados)

---

## 📚 Documentación de Referencia

- **`restriction.md`**: Checklist completo de restricciones
- **`AUTOMATIZACION_RESTRICCIONES.md`**: Cómo funcionan las verificaciones automáticas
- **`CHECKLIST_RESTRICCIONES_POR_FASE.md`**: Checklists por fase
- **`VARIABLES_ENTORNO.md`**: Configuración de variables de entorno

---

## 🆘 Troubleshooting

### Los hooks no se ejecutan
```bash
npx husky install
chmod +x .husky/*
```

### Error: .env no encontrado
```bash
cp .env.example .env
# Completar valores
```

### TypeScript errors
```bash
cd iyf_backend_2026
npx tsc --noEmit
# Revisar errores y corregir
```

---

## 🎯 Siguiente Paso

Una vez completado el setup inicial:

1. **Fase 1**: Configurar Supabase y base de datos
   - Ver `GUIA_SUPABASE.md`
   - Ejecutar scripts SQL
   - Configurar RLS

2. **Fase 2**: Integrar Supabase en Angular
   - Instalar `@supabase/supabase-js`
   - Crear servicio de Supabase
   - Actualizar servicio de auth

---

**¡Listo para empezar a desarrollar! 🚀**

