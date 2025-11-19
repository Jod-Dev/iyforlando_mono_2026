# Checklist de Restricciones por Fase - IYF Orlando 2026

Este documento proporciona checklists específicos de restricciones para cada fase del desarrollo. **Debe completarse antes de avanzar a la siguiente fase.**

---

## 🚀 Fase 0: Setup Inicial

### Restricciones de Sección 0 (Before starting)
- [ ] Objetivo del proyecto definido y documentado
- [ ] Datos personales que se procesarán identificados
- [ ] Stack tecnológico definido (Angular, Supabase, Cloudflare)
- [ ] Control de versiones (Git) configurado
- [ ] README inicial creado con:
  - [ ] Descripción corta del proyecto
  - [ ] Instrucciones de instalación y ejecución
  - [ ] Requisitos (Node, npm, etc.)

### Restricciones de Sección 1.7 (Secret management)
- [ ] Archivo `.env` creado
- [ ] `.env` agregado a `.gitignore`
- [ ] Variables de entorno documentadas
- [ ] Supabase URL y Anon Key configurados
- [ ] Service Role Key identificado (NUNCA en frontend)
- [ ] Verificado que no hay secrets en el repositorio

### Restricciones de Sección 9 (Workflow)
- [ ] Repositorio Git inicializado
- [ ] `.gitignore` completo y verificado
- [ ] Estrategia de branching definida
- [ ] Convenciones de commits definidas

**✅ Fase 0 completa cuando:** Todos los items están marcados

---

## 🗄️ Fase 1: Configuración de Base de Datos

### Restricciones de Sección 1.8 (RLS)
- [ ] RLS habilitado en TODAS las tablas
- [ ] Políticas RLS creadas para SELECT en todas las tablas
- [ ] Políticas RLS creadas para INSERT en todas las tablas
- [ ] Políticas RLS creadas para UPDATE en todas las tablas
- [ ] Políticas RLS creadas para DELETE en todas las tablas
- [ ] Políticas probadas:
  - [ ] Usuarios solo pueden acceder a sus propios datos
  - [ ] Admins pueden acceder a todos los datos
  - [ ] Usuarios no autenticados tienen restricciones apropiadas
- [ ] Políticas RLS documentadas

### Restricciones de Sección 1.9 (Supabase Security)
- [ ] Backups automáticos configurados en Supabase
- [ ] Connection pooling configurado apropiadamente
- [ ] Monitoreo de base de datos configurado

### Restricciones de Sección 1.2.1 (Data Retention)
- [ ] Períodos de retención definidos:
  - [ ] Datos de usuarios activos
  - [ ] Datos de usuarios inactivos
  - [ ] Datos eliminados (soft delete)
  - [ ] Logs de auditoría
- [ ] Funciones de eliminación/anonymización creadas
- [ ] Política de retención documentada

### Restricciones de Sección 8.1 (Supabase API)
- [ ] Constraints de base de datos configurados (NOT NULL, CHECK, etc.)
- [ ] Índices creados para columnas frecuentemente consultadas
- [ ] Funciones de base de datos para operaciones complejas

**✅ Fase 1 completa cuando:** Todas las políticas RLS están creadas, probadas y documentadas

---

## 🔐 Fase 2: Autenticación y Autorización

### Restricciones de Sección 1.4 (Authentication)
- [ ] Supabase Auth configurado
- [ ] Expiración de tokens JWT configurada apropiadamente
- [ ] Refresh tokens implementados
- [ ] Manejo de sesión/token expiration

### Restricciones de Sección 1.4.1 (Rate Limiting)
- [ ] Rate limiting configurado en endpoints de autenticación
- [ ] Rate limiting en login
- [ ] Rate limiting en signup
- [ ] Rate limiting en password reset
- [ ] DDoS protection (Cloudflare) verificada

### Restricciones de Sección 1.5 (XSS Protection)
- [ ] Validación de inputs en formularios de auth
- [ ] Sanitización de datos antes de almacenar
- [ ] No uso de innerHTML sin sanitización

### Restricciones de Sección 1.6 (Logging)
- [ ] Logging de intentos de login fallidos
- [ ] Logging de eventos de seguridad
- [ ] NO se loggean contraseñas
- [ ] NO se loggean tokens
- [ ] Logging estructurado configurado

### Restricciones de Sección 1.8 (RLS - Auth)
- [ ] Políticas RLS verifican roles correctamente
- [ ] Política para perfiles de usuario (users pueden ver/editar su propio perfil)
- [ ] Política para admins (pueden ver todos los perfiles)

### Restricciones de Sección 3.2 (Error Handling)
- [ ] Manejo de errores en auth sin exponer información sensible
- [ ] Mensajes de error claros para usuarios
- [ ] Estados de loading/error en UI de auth

### Restricciones de Sección 5.1 (Accessibility - Auth)
- [ ] Formularios de auth accesibles:
  - [ ] Labels asociados a inputs
  - [ ] Navegación por teclado funciona
  - [ ] Mensajes de error asociados a inputs
  - [ ] Contraste de colores adecuado

**✅ Fase 2 completa cuando:** Autenticación funciona, RLS verifica roles, rate limiting activo, logging configurado

---

## 📚 Fase 3: Feature - Academias y Cursos

### Restricciones de Sección 1.8 (RLS - Academias)
- [ ] RLS habilitado en tabla `academies`
- [ ] RLS habilitado en tabla `courses`
- [ ] RLS habilitado en tabla `course_registrations`
- [ ] Políticas:
  - [ ] Todos pueden ver academias activas
  - [ ] Solo admins pueden crear/editar/eliminar academias
  - [ ] Todos pueden ver cursos abiertos
  - [ ] Solo admins pueden crear/editar/eliminar cursos
  - [ ] Usuarios pueden ver sus propios registros
  - [ ] Usuarios pueden crear sus propios registros
  - [ ] Solo admins pueden aprobar/rechazar registros

### Restricciones de Sección 1.5 (Input Validation)
- [ ] Validación de inputs en formularios de cursos
- [ ] Sanitización de datos antes de guardar
- [ ] Validación de capacidad máxima
- [ ] Prevención de registro duplicado (constraint UNIQUE)

### Restricciones de Sección 8.1 (Query Optimization)
- [ ] Queries optimizadas (usar select() para limitar columnas)
- [ ] Índices en columnas frecuentemente consultadas
- [ ] Paginación para listas grandes de cursos
- [ ] Evitar N+1 queries (usar joins)

### Restricciones de Sección 7.1 (Angular Best Practices)
- [ ] Componentes usan OnPush cuando es posible
- [ ] Observables se desuscriben apropiadamente
- [ ] Formularios reactivos para forms complejos
- [ ] Lazy loading para módulo de academias

### Restricciones de Sección 3.2 (Error Handling)
- [ ] Estados de loading durante carga de cursos
- [ ] Estados de error cuando falla la carga
- [ ] Estados vacíos cuando no hay cursos
- [ ] Mensajes de error claros y accionables
- [ ] Retry mechanism para operaciones fallidas

### Restricciones de Sección 5.1 (Accessibility)
- [ ] Formularios accesibles (labels, ARIA, keyboard nav)
- [ ] Listas de cursos accesibles
- [ ] Contraste de colores adecuado
- [ ] Navegación por teclado funciona

### Restricciones de Sección 1.6 (Logging)
- [ ] Logging de creación/edición de cursos (quién, cuándo)
- [ ] Logging de registros de estudiantes (sin datos sensibles)
- [ ] Logging de aprobaciones/rechazos

### Restricciones de Sección 3.1 (Testing)
- [ ] Unit tests para lógica de cursos
- [ ] Integration tests para flujos de registro
- [ ] Security tests para políticas RLS
- [ ] E2E tests para flujo completo de registro

**✅ Fase 3 completa cuando:** Feature funciona, RLS probado, tests pasando, accesible

---

## 🎉 Fase 4: Feature - Eventos

### Restricciones de Sección 1.8 (RLS - Eventos)
- [ ] RLS habilitado en tabla `events`
- [ ] RLS habilitado en tabla `event_registrations`
- [ ] Políticas:
  - [ ] Todos pueden ver eventos públicos y próximos
  - [ ] Solo admins pueden crear/editar/eliminar eventos
  - [ ] Usuarios pueden ver sus propios registros
  - [ ] Usuarios pueden registrarse en eventos

### Restricciones de Sección 1.4.1 (Rate Limiting)
- [ ] Rate limiting en registro de eventos
- [ ] Prevención de spam de registros

### Restricciones de Sección 6.1 (Performance)
- [ ] Paginación en lista de eventos
- [ ] Filtros eficientes
- [ ] Queries optimizadas

### Restricciones de Sección 1.2.1 (Data Retention)
- [ ] Considerar retención de registros de eventos antiguos
- [ ] Política de eliminación de eventos completados

### Restricciones de Sección 3.2 (Error Handling)
- [ ] Manejo de eventos llenos
- [ ] Manejo de eventos cancelados
- [ ] Notificaciones apropiadas

**✅ Fase 4 completa cuando:** Feature funciona, rate limiting activo, performance verificado

---

## 👥 Fase 5: Feature - Voluntarios

### Restricciones de Sección 1.2 (Data Minimization)
- [ ] Solo recolectar datos necesarios de voluntarios
- [ ] No solicitar datos sensibles innecesarios

### Restricciones de Sección 1.8 (RLS - Voluntarios)
- [ ] RLS habilitado en tabla `volunteers`
- [ ] Políticas:
  - [ ] Usuarios pueden ver/editar su propio perfil de voluntario
  - [ ] Admins pueden ver todos los voluntarios
  - [ ] Usuarios pueden crear su propio perfil de voluntario

### Restricciones de Sección 1.2.1 (Right to be Forgotten)
- [ ] Usuarios pueden eliminar su perfil de voluntario
- [ ] Eliminación en cascada de datos relacionados

**✅ Fase 5 completa cuando:** Feature funciona, data minimization verificado, RLS probado

---

## 🧪 Fase 6: Testing Completo

### Restricciones de Sección 3.1 (Testing)
- [ ] Cobertura de código >= 80%
- [ ] Unit tests para lógica crítica
- [ ] Integration tests para flujos completos
- [ ] E2E tests para flujos principales
- [ ] Security tests:
  - [ ] Tests de políticas RLS
  - [ ] Tests de autenticación
  - [ ] Tests de autorización
- [ ] Accessibility tests:
  - [ ] Keyboard navigation
  - [ ] Screen reader
  - [ ] Contraste de colores
- [ ] Performance tests:
  - [ ] Queries lentas identificadas
  - [ ] Bundle size verificado

### Restricciones de Sección 3.1 (Test Data)
- [ ] Test fixtures, no datos de producción
- [ ] Limpieza de datos de prueba después de tests
- [ ] No datos sensibles en fixtures

**✅ Fase 6 completa cuando:** Todos los tests pasan, cobertura >= 80%, security tests pasando

---

## 🚀 Fase 7: Pre-Deployment

### Restricciones de Sección 1.3 (HTTPS)
- [ ] HTTPS configurado en producción (Cloudflare Pages)
- [ ] Certificado SSL válido
- [ ] Redirección HTTP -> HTTPS

### Restricciones de Sección 1.5 (CSP)
- [ ] Content Security Policy configurado
- [ ] Headers CSP en producción
- [ ] CSP probado (no rompe funcionalidad)

### Restricciones de Sección 1.6 (Logging Production)
- [ ] Logging de producción configurado (Sentry, LogRocket, etc.)
- [ ] Alertas de errores críticos configuradas
- [ ] Retención de logs apropiada

### Restricciones de Sección 1.7.1 (Backup)
- [ ] Backups verificados
- [ ] Procedimiento de restauración documentado
- [ ] Backup reciente probado

### Restricciones de Sección 9 (CI/CD)
- [ ] Pipeline CI/CD configurado
- [ ] Linters ejecutándose en CI
- [ ] Tests ejecutándose en CI
- [ ] Deploy automático a staging
- [ ] Deploy a producción (manual o automático)

### Restricciones de Sección 10 (Before merge/deploy)
- [ ] Código cumple todas las reglas de seguridad y privacidad
- [ ] Código cumple principios de diseño
- [ ] No warnings importantes en consola
- [ ] Rutas principales funcionan
- [ ] Estados de loading/error manejados
- [ ] UI aceptable en móvil y desktop
- [ ] Tests relevantes pasan
- [ ] Políticas RLS probadas
- [ ] Performance verificado
- [ ] Accesibilidad verificada

**✅ Fase 7 completa cuando:** Todos los checks pasan, listo para producción

---

## 📊 Verificación Continua

### Diaria:
- [ ] Commits no contienen secrets
- [ ] Código sigue convenciones
- [ ] Tests pasan localmente

### Semanal:
- [ ] Revisión de cumplimiento de restricciones
- [ ] Actualización de documentación si es necesario
- [ ] Revisión de logs de seguridad

### Mensual:
- [ ] Auditoría completa de restricciones
- [ ] Revisión de políticas RLS
- [ ] Actualización de restricciones si cambian requerimientos

---

**Este checklist debe completarse en cada fase antes de avanzar a la siguiente.**

