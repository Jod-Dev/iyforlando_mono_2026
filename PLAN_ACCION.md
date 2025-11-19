# Plan de Acción Detallado - IYF Orlando 2026

## 🎯 Objetivo General
Desarrollar una plataforma web completa para gestionar academias, eventos y voluntarios de IYF Orlando.

**⚠️ IMPORTANTE**: Este plan debe seguirse en conjunto con `restriction.md`. Todas las restricciones deben verificarse en cada fase. Ver `INTEGRACION_RESTRICCIONES.md` y `CHECKLIST_RESTRICCIONES_POR_FASE.md` para detalles.

---

## 📅 Cronograma de Desarrollo

### **Sprint 1: Setup y Backend Base** (Semana 1-2)

#### Tareas Backend
- [ ] **Día 1-2: Decisión de Stack**
  - Evaluar opciones: Node.js/Express vs Python/Django
  - Decidir base de datos: PostgreSQL vs MongoDB
  - Crear repositorio y estructura inicial

- [ ] **Día 3-4: Configuración Inicial**
  - Setup del proyecto backend
  - Configuración de base de datos
  - Configuración de variables de entorno
  - Setup de ESLint/Prettier (si Node.js)

- [ ] **Día 5-7: Autenticación**
  - Modelo de Usuario
  - Sistema de registro
  - Sistema de login con JWT
  - Refresh tokens
  - Middleware de autenticación
  - Middleware de autorización (roles)

- [ ] **Día 8-10: Modelos Base**
  - Modelo de Semestre
  - Modelo de Academia
  - Modelo de Curso
  - Modelo de Evento
  - Relaciones entre modelos
  - Migraciones/Seeders

#### Tareas Frontend
- [ ] **Día 1-3: Personalización Básica**
  - Cambiar logo y favicon
  - Actualizar colores del tema
  - Cambiar nombre de la aplicación
  - Limpiar navegación (eliminar módulos no usados)

- [ ] **Día 4-5: Estructura de Módulos**
  - Crear módulo `admin`
  - Crear módulo `student`
  - Crear módulo `volunteer`
  - Crear módulo `public`
  - Configurar rutas base

- [ ] **Día 6-7: Servicios Base**
  - Servicio de autenticación (conectar con API real)
  - Servicio HTTP base
  - Interceptores HTTP
  - Manejo de errores global

#### Entregables Sprint 1
- ✅ Backend funcionando con autenticación
- ✅ Frontend personalizado básicamente
- ✅ Usuario puede registrarse y hacer login
- ✅ Base de datos con modelos principales

---

### **Sprint 2: Módulo de Academias - Parte 1** (Semana 3-4)

#### Tareas Backend
- [ ] **Día 1-3: APIs de Semestres**
  - GET /api/semesters (listar)
  - GET /api/semesters/:id (detalle)
  - POST /api/semesters (crear - admin)
  - PUT /api/semesters/:id (actualizar - admin)
  - DELETE /api/semesters/:id (eliminar - admin)
  - GET /api/semesters/active (semestre activo)

- [ ] **Día 4-5: APIs de Academias**
  - GET /api/academies
  - GET /api/academies/:id
  - POST /api/academies (admin)
  - PUT /api/academies/:id (admin)
  - DELETE /api/academies/:id (admin)

- [ ] **Día 6-7: APIs de Cursos**
  - GET /api/courses
  - GET /api/courses/:id
  - GET /api/courses/semester/:semesterId
  - POST /api/courses (admin)
  - PUT /api/courses/:id (admin)
  - DELETE /api/courses/:id (admin)
  - Validación de capacidad máxima

#### Tareas Frontend
- [ ] **Día 1-3: Gestión de Semestres (Admin)**
  - Lista de semestres
  - Formulario crear/editar semestre
  - Activar/desactivar semestre
  - Validaciones

- [ ] **Día 4-5: Gestión de Academias (Admin)**
  - Lista de academias
  - Formulario crear/editar academia
  - Eliminar academia

- [ ] **Día 6-7: Gestión de Cursos (Admin)**
  - Lista de cursos por semestre
  - Formulario crear/editar curso
  - Asignar instructor
  - Definir horarios
  - Establecer capacidad
  - Eliminar curso

#### Entregables Sprint 2
- ✅ Admin puede gestionar semestres
- ✅ Admin puede gestionar academias
- ✅ Admin puede gestionar cursos
- ✅ APIs funcionando correctamente

---

### **Sprint 3: Módulo de Academias - Parte 2** (Semana 5-6)

#### Tareas Backend
- [ ] **Día 1-3: APIs de Registros de Cursos**
  - POST /api/course-registrations (registro)
  - GET /api/course-registrations/my-registrations
  - GET /api/course-registrations (admin - todos)
  - PUT /api/course-registrations/:id/approve (admin)
  - PUT /api/course-registrations/:id/reject (admin)
  - DELETE /api/course-registrations/:id (cancelar)
  - Lógica de lista de espera

- [ ] **Día 4-5: Validaciones y Lógica de Negocio**
  - Validar cupos disponibles
  - Manejar lista de espera
  - Notificar cuando hay cupo disponible
  - Validar que no se registre dos veces

- [ ] **Día 6-7: APIs Adicionales**
  - GET /api/courses/:id/students (lista de estudiantes)
  - GET /api/courses/:id/waitlist (lista de espera)
  - Estadísticas de cursos

#### Tareas Frontend
- [ ] **Día 1-3: Vista Pública de Cursos**
  - Lista de cursos disponibles por semestre
  - Filtros (academia, horario, etc.)
  - Detalle de curso
  - Información de cupos disponibles

- [ ] **Día 4-5: Registro de Estudiantes**
  - Formulario de registro a curso
  - Validación de cupos
  - Confirmación de registro
  - Vista de "Mis Cursos"

- [ ] **Día 6-7: Gestión de Registros (Admin)**
  - Lista de registros pendientes
  - Aprobar/rechazar registros
  - Ver estudiantes inscritos
  - Gestionar lista de espera
  - Enviar notificaciones

#### Entregables Sprint 3
- ✅ Estudiantes pueden ver cursos y registrarse
- ✅ Admin puede gestionar registros
- ✅ Sistema de lista de espera funcionando
- ✅ Notificaciones básicas

---

### **Sprint 4: Módulo de Eventos** (Semana 7-8)

#### Tareas Backend
- [ ] **Día 1-3: APIs de Eventos**
  - GET /api/events
  - GET /api/events/:id
  - GET /api/events/upcoming
  - POST /api/events (admin)
  - PUT /api/events/:id (admin)
  - DELETE /api/events/:id (admin)
  - Filtros (fecha, categoría, etc.)

- [ ] **Día 4-5: APIs de Registros de Eventos**
  - POST /api/event-registrations
  - GET /api/event-registrations/my-registrations
  - GET /api/event-registrations (admin)
  - PUT /api/event-registrations/:id/cancel
  - DELETE /api/event-registrations/:id
  - Lógica de lista de espera

- [ ] **Día 6-7: APIs Adicionales**
  - GET /api/events/:id/participants
  - GET /api/events/:id/volunteers
  - Estadísticas de eventos

#### Tareas Frontend
- [ ] **Día 1-3: Gestión de Eventos (Admin)**
  - Lista de eventos
  - Formulario crear/editar evento
  - Definir si requiere voluntarios
  - Establecer capacidad
  - Eliminar evento

- [ ] **Día 4-5: Vista Pública de Eventos**
  - Lista de eventos disponibles
  - Filtros (fecha, categoría)
  - Detalle de evento
  - Información de cupos

- [ ] **Día 6-7: Registro de Eventos**
  - Formulario de registro
  - Registro como participante
  - Vista de "Mis Eventos"
  - Cancelar registro
  - Gestión de registros (admin)

#### Entregables Sprint 4
- ✅ Admin puede gestionar eventos
- ✅ Usuarios pueden ver y registrarse en eventos
- ✅ Sistema de registro funcionando
- ✅ Gestión de participantes

---

### **Sprint 5: Módulo de Voluntarios** (Semana 9)

#### Tareas Backend
- [ ] **Día 1-2: Modelo de Voluntario**
  - Crear modelo Volunteer
  - Relación con User
  - Campos adicionales (skills, availability, hours)

- [ ] **Día 3-4: APIs de Voluntarios**
  - POST /api/volunteers/register
  - GET /api/volunteers
  - GET /api/volunteers/:id
  - GET /api/volunteers/my-profile
  - PUT /api/volunteers/:id
  - Actualizar horas de servicio

- [ ] **Día 5: APIs de Registro de Voluntarios para Eventos**
  - POST /api/event-registrations (tipo: volunteer)
  - GET /api/events/requiring-volunteers
  - Aprobar/rechazar voluntarios (admin)

#### Tareas Frontend
- [ ] **Día 1-2: Registro de Voluntarios**
  - Formulario de registro
  - Completar perfil (skills, availability)
  - Vista de perfil de voluntario

- [ ] **Día 3-4: Vista de Eventos que Requieren Voluntarios**
  - Lista de eventos
  - Detalle de necesidades de voluntarios
  - Registro como voluntario

- [ ] **Día 5: Gestión de Voluntarios (Admin)**
  - Lista de voluntarios
  - Asignar a eventos
  - Ver historial
  - Actualizar horas de servicio

#### Entregables Sprint 5
- ✅ Usuarios pueden registrarse como voluntarios
- ✅ Voluntarios pueden registrarse para eventos
- ✅ Admin puede gestionar voluntarios
- ✅ Sistema de horas de servicio

---

### **Sprint 6: Dashboard y Reportes** (Semana 10)

#### Tareas Backend
- [ ] **Día 1-3: APIs de Estadísticas**
  - GET /api/dashboard/stats
    - Total estudiantes
    - Total eventos
    - Total voluntarios
    - Cursos más populares
  - GET /api/dashboard/registrations-chart
  - GET /api/dashboard/events-chart
  - GET /api/dashboard/volunteers-chart

- [ ] **Día 4-5: Optimización de Queries**
  - Optimizar consultas de estadísticas
  - Caché si es necesario
  - Agregaciones eficientes

#### Tareas Frontend
- [ ] **Día 1-3: Dashboard Administrativo**
  - Métricas principales (cards)
  - Gráficos de registros
  - Gráficos de eventos
  - Gráficos de voluntarios
  - Accesos rápidos

- [ ] **Día 4-5: Dashboard de Usuario**
  - Mis cursos
  - Mis eventos
  - Mi historial de voluntariado
  - Próximos eventos

#### Entregables Sprint 6
- ✅ Dashboard completo para admin
- ✅ Dashboard para usuarios
- ✅ Gráficos y estadísticas
- ✅ Métricas en tiempo real

---

### **Sprint 7: Notificaciones y Mejoras** (Semana 11)

#### Tareas Backend
- [ ] **Día 1-2: Sistema de Notificaciones**
  - Modelo de Notificación
  - Crear notificaciones
  - Marcar como leídas
  - APIs de notificaciones

- [ ] **Día 3-4: Emails**
  - Configurar servicio de email (SendGrid, etc.)
  - Templates de email
  - Enviar confirmaciones de registro
  - Enviar recordatorios de eventos
  - Enviar notificaciones de aprobación

- [ ] **Día 5: Recordatorios Automáticos**
  - Job para recordatorios de eventos
  - Notificar cuando hay cupo disponible

#### Tareas Frontend
- [ ] **Día 1-2: Componente de Notificaciones**
  - Badge de notificaciones
  - Lista de notificaciones
  - Marcar como leídas
  - Notificaciones en tiempo real (opcional)

- [ ] **Día 3-4: Mejoras de UX**
  - Loading states mejorados
  - Mensajes de error más claros
  - Confirmaciones de acciones
  - Validaciones en tiempo real

- [ ] **Día 5: Optimizaciones**
  - Lazy loading de módulos
  - Optimización de imágenes
  - Caché de datos

#### Entregables Sprint 7
- ✅ Sistema de notificaciones funcionando
- ✅ Emails automáticos
- ✅ Mejoras de UX implementadas
- ✅ Optimizaciones aplicadas

---

### **Sprint 8: Testing y Deployment** (Semana 12)

#### Tareas Testing
- [ ] **Día 1-2: Testing Backend**
  - Unit tests de modelos
  - Unit tests de servicios
  - Integration tests de APIs
  - Testing de autenticación

- [ ] **Día 3: Testing Frontend**
  - Unit tests de componentes
  - Unit tests de servicios
  - Testing de rutas

- [ ] **Día 4: Testing E2E**
  - Flujo completo de registro
  - Flujo de registro a curso
  - Flujo de registro a evento
  - Flujo de voluntarios

#### Tareas Deployment
- [ ] **Día 1: Configuración de Producción**
  - Variables de entorno
  - Configuración de base de datos de producción
  - Configuración de servidor

- [ ] **Día 2: Deployment**
  - Deploy del backend
  - Deploy del frontend
  - Configurar SSL/HTTPS
  - Configurar dominio

- [ ] **Día 3: Post-Deployment**
  - Backup de base de datos
  - Configurar monitoreo
  - Configurar logs
  - Documentación final

#### Entregables Sprint 8
- ✅ Aplicación desplegada en producción
- ✅ Tests pasando
- ✅ Documentación completa
- ✅ Sistema funcionando correctamente

---

## 🔄 Flujos Principales del Sistema

### Flujo 1: Registro de Estudiante a Curso
```
1. Usuario hace login
2. Navega a "Academias" o "Cursos"
3. Selecciona semestre
4. Ve lista de cursos disponibles
5. Selecciona un curso
6. Ve detalles del curso (horario, instructor, cupos)
7. Hace clic en "Registrarse"
8. Sistema valida cupos disponibles
9. Si hay cupo: Registro pendiente de aprobación
10. Si no hay cupo: Se agrega a lista de espera
11. Admin recibe notificación
12. Admin aprueba/rechaza
13. Estudiante recibe notificación
```

### Flujo 2: Registro a Evento
```
1. Usuario hace login (o no, si es público)
2. Navega a "Eventos"
3. Ve lista de eventos disponibles
4. Filtra por fecha/categoría
5. Selecciona un evento
6. Ve detalles (fecha, hora, ubicación, cupos)
7. Hace clic en "Registrarse"
8. Sistema valida cupos
9. Registro confirmado (o lista de espera)
10. Usuario recibe confirmación
11. Recibe recordatorio días antes del evento
```

### Flujo 3: Registro como Voluntario
```
1. Usuario hace login
2. Navega a "Voluntarios"
3. Hace clic en "Registrarse como Voluntario"
4. Completa formulario (skills, availability)
5. Perfil de voluntario creado
6. Ve eventos que requieren voluntarios
7. Selecciona evento
8. Se registra como voluntario
9. Admin aprueba asignación
10. Voluntario recibe confirmación
11. Horas de servicio se actualizan después del evento
```

---

## 📊 Métricas de Éxito

### Técnicas
- ✅ Todas las funcionalidades implementadas
- ✅ Tests con >80% de cobertura
- ✅ Tiempo de respuesta <500ms
- ✅ Sin errores críticos en producción

### Funcionales
- ✅ Admin puede gestionar todo el sistema
- ✅ Estudiantes pueden registrarse sin problemas
- ✅ Eventos se gestionan correctamente
- ✅ Voluntarios pueden registrarse y ser asignados

### Usuario
- ✅ Interfaz intuitiva
- ✅ Procesos claros
- ✅ Notificaciones funcionando
- ✅ Documentación disponible

---

## 🚨 Riesgos y Mitigaciones

### Riesgo 1: Retrasos en el desarrollo
**Mitigación**: Priorizar funcionalidades core, dejar opcionales para después

### Riesgo 2: Problemas con la base de datos
**Mitigación**: Diseñar bien el esquema desde el inicio, hacer backups regulares

### Riesgo 3: Problemas de seguridad
**Mitigación**: Implementar buenas prácticas desde el inicio, hacer security audit

### Riesgo 4: Performance con muchos usuarios
**Mitigación**: Optimizar queries, implementar caché, hacer load testing

---

## 📝 Notas Adicionales

1. **Priorización**: Si hay retrasos, priorizar:
   - Autenticación
   - Registro de estudiantes a cursos
   - Gestión básica de eventos
   - Dashboard básico

2. **Funcionalidades Opcionales** (para después):
   - Certificados digitales
   - Pagos online (si es necesario)
   - Integración con calendario
   - App móvil

3. **Mejoras Futuras**:
   - Sistema de calificaciones
   - Foros de discusión
   - Biblioteca de recursos
   - Sistema de badges/logros

---

**Este plan será actualizado conforme avance el proyecto.**

