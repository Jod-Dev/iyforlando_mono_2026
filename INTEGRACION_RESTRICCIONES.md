# Integración de Restricciones en el Desarrollo - IYF Orlando 2026

Este documento asegura que **TODAS** las restricciones definidas en `restriction.md` se integren en cada fase del desarrollo del proyecto.

---

## 🎯 Objetivo

Garantizar que cada línea de código, cada feature, y cada decisión técnica cumpla con las restricciones de seguridad, privacidad, calidad y mejores prácticas definidas.

---

## 📋 Mapeo de Restricciones por Fase de Desarrollo

### Fase 0: Setup Inicial

#### Restricciones a Verificar:
- [ ] **0. Before starting**: Objetivo, datos personales, stack definidos
- [ ] **1.7. Secret management**: Variables de entorno configuradas
- [ ] **1.9. Supabase keys**: Anon Key y Service Role Key en .env
- [ ] **9. Workflow**: Git configurado, .gitignore completo

#### Checklist de Verificación:
```markdown
- [ ] README creado con descripción, instalación, requisitos
- [ ] .env configurado con todas las variables necesarias
- [ ] .env agregado a .gitignore
- [ ] .gitignore verificado (no commitea secrets)
- [ ] Repositorio Git inicializado
- [ ] Estructura de proyecto definida
```

---

### Fase 1: Configuración de Base de Datos (Supabase)

#### Restricciones a Verificar:
- [ ] **1.8. RLS**: RLS habilitado en TODAS las tablas
- [ ] **1.8. RLS**: Políticas creadas para SELECT, INSERT, UPDATE, DELETE
- [ ] **1.9. Database security**: Backups configurados
- [ ] **1.2.1. Data retention**: Políticas de retención definidas
- [ ] **1.10. Compliance**: Consideraciones GDPR documentadas

#### Checklist de Verificación:
```markdown
- [ ] Todas las tablas tienen RLS habilitado
- [ ] Políticas RLS creadas y documentadas
- [ ] Políticas probadas (usuarios solo ven sus datos, admins ven todo)
- [ ] Backups automáticos configurados en Supabase
- [ ] Política de retención de datos documentada
- [ ] Funciones de base de datos para eliminación/anonymización creadas
- [ ] Constraints de base de datos (NOT NULL, CHECK, etc.) configurados
```

#### Script de Verificación RLS:
```sql
-- Verificar que todas las tablas tienen RLS habilitado
SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename NOT IN (
  SELECT tablename 
  FROM pg_tables t
  JOIN pg_class c ON c.relname = t.tablename
  WHERE c.relrowsecurity = true
);
```

---

### Fase 2: Autenticación y Autorización

#### Restricciones a Verificar:
- [ ] **1.4. Authentication**: JWT manejado correctamente
- [ ] **1.4. Authentication**: Expiración de tokens configurada
- [ ] **1.4.1. Rate limiting**: Rate limiting en endpoints de auth
- [ ] **1.8. RLS**: Políticas de autorización en base de datos
- [ ] **1.6. Logging**: Logging de eventos de seguridad (login fallidos)
- [ ] **1.5. XSS**: Sanitización de inputs de usuario

#### Checklist de Verificación:
```markdown
- [ ] Supabase Auth configurado correctamente
- [ ] Tokens JWT con expiración apropiada
- [ ] Rate limiting configurado en Supabase (o Edge Functions)
- [ ] Políticas RLS verifican roles correctamente
- [ ] Logging de intentos de login fallidos
- [ ] Validación de inputs en formularios de auth
- [ ] Sanitización de datos antes de almacenar
- [ ] Protección contra brute-force implementada
```

#### Código de Ejemplo - Validación de Auth:
```typescript
// auth.service.ts debe incluir:
- Validación de email format
- Validación de password strength
- Rate limiting (usar Supabase o Edge Function)
- Logging de eventos de seguridad
- Manejo de errores sin exponer información sensible
```

---

### Fase 3: Desarrollo de Features - Academias

#### Restricciones a Verificar:
- [ ] **1.8. RLS**: Políticas para tablas de academias/cursos
- [ ] **1.2.1. Data retention**: Considerar retención de registros
- [ ] **8.1. Supabase API**: Optimización de queries
- [ ] **7.1. Angular**: OnPush, unsubscription, etc.
- [ ] **3.2. Error handling**: Estados de error en UI
- [ ] **5.1. Accessibility**: Formularios accesibles

#### Checklist por Feature:

**Crear/Editar Curso:**
```markdown
- [ ] RLS policy permite solo admins crear/editar
- [ ] Validación de inputs (frontend y backend)
- [ ] Sanitización de datos antes de guardar
- [ ] Manejo de errores con mensajes claros
- [ ] Estados de loading/error/success en UI
- [ ] Formulario accesible (labels, ARIA, keyboard nav)
- [ ] Logging de acciones críticas (quién creó/editó)
```

**Registro de Estudiante:**
```markdown
- [ ] RLS policy permite estudiantes registrarse
- [ ] Validación de cupos disponibles
- [ ] Prevención de registro duplicado (constraint UNIQUE)
- [ ] Notificación al usuario (éxito/error)
- [ ] Logging de registro (sin datos sensibles)
- [ ] Manejo de lista de espera
```

---

### Fase 4: Desarrollo de Features - Eventos

#### Restricciones a Verificar:
- [ ] **1.8. RLS**: Políticas para eventos y registros
- [ ] **1.4.1. Rate limiting**: Rate limiting en registro de eventos
- [ ] **6.1. Performance**: Paginación para listas grandes
- [ ] **3.2. Error handling**: Manejo de errores de capacidad
- [ ] **5.1. Accessibility**: Listas accesibles

#### Checklist:
```markdown
- [ ] RLS policies para eventos (públicos vs privados)
- [ ] Rate limiting en registro de eventos
- [ ] Paginación en lista de eventos
- [ ] Validación de capacidad máxima
- [ ] Manejo de eventos llenos
- [ ] Notificaciones de recordatorio (con consentimiento)
```

---

### Fase 5: Desarrollo de Features - Voluntarios

#### Restricciones a Verificar:
- [ ] **1.2. Handling personal data**: Datos mínimos necesarios
- [ ] **1.8. RLS**: Políticas para voluntarios
- [ ] **1.10. Compliance**: Consideraciones de datos de voluntarios

#### Checklist:
```markdown
- [ ] Solo recolectar datos necesarios de voluntarios
- [ ] RLS policies para acceso a datos de voluntarios
- [ ] Permisos claros (quién puede ver qué)
- [ ] Opción de eliminar perfil de voluntario
```

---

### Fase 6: Testing

#### Restricciones a Verificar:
- [ ] **3.1. Testing**: Cobertura mínima 80%
- [ ] **3.1. Testing**: Tests de seguridad (RLS, auth)
- [ ] **3.1. Testing**: Tests de accesibilidad
- [ ] **1.8. RLS**: Tests de políticas RLS

#### Checklist de Testing:
```markdown
- [ ] Unit tests para lógica crítica
- [ ] Integration tests para flujos completos
- [ ] E2E tests para flujos principales
- [ ] Security tests (RLS policies, auth, authorization)
- [ ] Accessibility tests (keyboard nav, screen reader)
- [ ] Performance tests (queries lentas, bundle size)
- [ ] Cobertura de código >= 80%
```

#### Tests de Seguridad Requeridos:
```typescript
// Ejemplo de tests de RLS
describe('RLS Policies', () => {
  it('should prevent users from accessing other users data', ...)
  it('should allow admins to access all data', ...)
  it('should prevent unauthenticated access', ...)
});
```

---

### Fase 7: Deployment

#### Restricciones a Verificar:
- [ ] **1.3. Storage and transmission**: HTTPS en producción
- [ ] **1.5. CSP**: Content Security Policy configurado
- [ ] **1.6. Logging**: Logging configurado en producción
- [ ] **1.7.1. Backup**: Backups verificados
- [ ] **9. CI/CD**: Pipeline configurado
- [ ] **10. Before merge/deploy**: Todos los checks pasan

#### Checklist Pre-Deployment:
```markdown
- [ ] HTTPS configurado (Cloudflare Pages)
- [ ] CSP headers configurados
- [ ] Variables de entorno de producción configuradas
- [ ] Logging de producción configurado (Sentry, etc.)
- [ ] Backups verificados
- [ ] Tests pasando en CI/CD
- [ ] Linters pasando
- [ ] No warnings importantes en consola
- [ ] Performance verificado (Core Web Vitals)
- [ ] Accesibilidad verificada
- [ ] RLS policies probadas en staging
```

---

## 🔄 Proceso de Desarrollo con Restricciones

### Flujo de Trabajo:

```
1. PLANIFICAR FEATURE
   ↓
   [ ] Revisar restriction.md - ¿Qué restricciones aplican?
   ↓
   [ ] Documentar decisiones de seguridad/privacidad
   ↓

2. DESARROLLAR
   ↓
   [ ] Implementar feature siguiendo restricciones
   ↓
   [ ] Verificar RLS policies si aplica
   ↓
   [ ] Validar inputs y sanitizar datos
   ↓
   [ ] Manejar errores apropiadamente
   ↓

3. TESTING
   ↓
   [ ] Unit tests (incluir tests de seguridad)
   ↓
   [ ] Integration tests
   ↓
   [ ] Verificar accesibilidad
   ↓
   [ ] Verificar performance
   ↓

4. CODE REVIEW
   ↓
   [ ] Revisar contra restriction.md
   ↓
   [ ] Verificar seguridad y privacidad
   ↓
   [ ] Verificar calidad de código
   ↓

5. PRE-MERGE
   ↓
   [ ] Todos los tests pasan
   ↓
   [ ] Linters pasan
   ↓
   [ ] Checklist de sección 10 completo
   ↓

6. DEPLOY
   ↓
   [ ] Verificar configuración de producción
   ↓
   [ ] Monitorear después de deploy
```

---

## 📝 Checklist de Code Review

Cada PR debe verificar:

### Seguridad y Privacidad:
- [ ] ¿Se validan todos los inputs?
- [ ] ¿Se sanitizan los datos antes de guardar?
- [ ] ¿Las políticas RLS están correctas?
- [ ] ¿No se exponen datos sensibles?
- [ ] ¿No se loggean contraseñas/tokens?
- [ ] ¿Se manejan errores sin exponer información sensible?

### Calidad de Código:
- [ ] ¿Sigue principios SOLID/DRY/KISS?
- [ ] ¿Tiene tests adecuados?
- [ ] ¿Maneja errores apropiadamente?
- [ ] ¿Es accesible (WCAG)?

### Angular Best Practices:
- [ ] ¿Usa OnPush cuando es posible?
- [ ] ¿Se desuscriben observables?
- [ ] ¿Formularios reactivos para forms complejos?
- [ ] ¿Lazy loading para módulos?

### Performance:
- [ ] ¿Queries optimizadas?
- [ ] ¿Paginación para listas grandes?
- [ ] ¿Bundle size razonable?

---

## 🎯 Integración en Plan de Acción

Cada sprint del `PLAN_ACCION.md` debe incluir:

1. **Al inicio del sprint**: Revisar qué restricciones aplican
2. **Durante desarrollo**: Verificar restricciones continuamente
3. **Al final del sprint**: Checklist completo de restricciones

---

## 📊 Dashboard de Cumplimiento

Crear un tracking de cumplimiento de restricciones:

### Por Categoría:
- **Seguridad y Privacidad**: X/Y cumplidas
- **Testing**: X/Y cumplidas
- **Accesibilidad**: X/Y cumplidas
- **Performance**: X/Y cumplidas
- **Calidad de Código**: X/Y cumplidas

### Por Feature:
- **Feature X**: X/Y restricciones cumplidas
- **Feature Y**: X/Y restricciones cumplidas

---

## 🔔 Alertas y Recordatorios

### Automatización:
- [ ] CI/CD falla si tests de seguridad fallan
- [ ] CI/CD falla si linters fallan
- [ ] Alertas si se detectan secrets en código
- [ ] Recordatorios periódicos de revisar restricciones

### Manual:
- [ ] Revisión semanal de cumplimiento
- [ ] Actualización de restricciones si cambian requerimientos
- [ ] Training del equipo en restricciones

---

## 📚 Recursos

- **restriction.md**: Checklist completo de restricciones
- **ANALISIS_RESTRICCIONES.md**: Análisis de qué falta
- **Este documento**: Integración en desarrollo

---

**Este documento debe ser consultado en cada fase del desarrollo para asegurar cumplimiento total de las restricciones.**

