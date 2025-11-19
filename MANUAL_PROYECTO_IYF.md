# Manual del Proyecto - IYF Orlando 2026

## 📋 Índice
1. [Información General del Proyecto](#información-general)
2. [Análisis de Requerimientos](#análisis-de-requerimientos)
3. [Arquitectura del Sistema](#arquitectura-del-sistema)
4. [Funcionalidades Principales](#funcionalidades-principales)
5. [Plan de Implementación](#plan-de-implementación)
6. [Estructura de Base de Datos](#estructura-de-base-de-datos)
7. [APIs y Endpoints](#apis-y-endpoints)
8. [Personalización de la Plantilla](#personalización-de-la-plantilla)
9. [Checklist de Desarrollo](#checklist-de-desarrollo)

---

## 📌 Información General del Proyecto

### Organización
- **Nombre**: IYF Orlando (International Youth Fellowship Orlando)
- **Tipo**: Organización sin fines de lucro
- **Propósito**: Impartir academias, organizar eventos y gestionar voluntarios

### Objetivo del Sistema
Crear una plataforma web completa que permita:
- Gestión de academias y cursos por semestre
- Registro de estudiantes por semestre
- Gestión de eventos con registro de participantes
- Gestión de voluntarios y sus registros
- Panel administrativo para gestión completa

### Stack Tecnológico
- **Frontend**: Angular 19 (Plantilla Fuse Angular)
- **Backend**: Supabase (Backend-as-a-Service)
  - Base de datos: PostgreSQL (gestionada por Supabase)
  - Autenticación: Supabase Auth (JWT integrado)
  - APIs REST: Auto-generadas por Supabase
  - Edge Functions: Para lógica de negocio compleja (opcional)
- **Hosting Frontend**: Cloudflare Pages
- **Storage**: Supabase Storage (para archivos/documentos)

---

## 🎯 Análisis de Requerimientos

### Usuarios del Sistema

#### 1. **Administradores**
- Gestionar academias y cursos
- Crear y gestionar eventos
- Gestionar registros de estudiantes
- Gestionar registros de voluntarios
- Ver reportes y estadísticas
- Gestionar usuarios del sistema

#### 2. **Estudiantes**
- Registrarse en academias por semestre
- Ver sus cursos inscritos
- Ver su historial académico
- Ver eventos disponibles
- Registrarse en eventos

#### 3. **Voluntarios**
- Registrarse como voluntarios
- Ver eventos que requieren voluntarios
- Registrarse para eventos como voluntario
- Ver su historial de voluntariado

#### 4. **Visitantes/No autenticados**
- Ver información de IYF Orlando
- Ver academias disponibles
- Ver eventos públicos
- Registrarse en el sistema

### Funcionalidades Principales Requeridas

#### **Módulo de Academias**
- ✅ Crear/editar/eliminar academias
- ✅ Crear/editar/eliminar cursos
- ✅ Definir semestres (Fall, Spring, Summer)
- ✅ Gestión de horarios y fechas
- ✅ Gestión de instructores
- ✅ Capacidad máxima de estudiantes por curso
- ✅ Lista de espera si el curso está lleno

#### **Módulo de Registro de Estudiantes**
- ✅ Registro por semestre
- ✅ Selección de cursos disponibles
- ✅ Validación de cupos disponibles
- ✅ Confirmación de registro
- ✅ Historial de registros por semestre
- ✅ Certificados o constancias de participación

#### **Módulo de Eventos**
- ✅ Crear/editar/eliminar eventos
- ✅ Definir fecha, hora, ubicación
- ✅ Capacidad máxima de participantes
- ✅ Registro de participantes
- ✅ Lista de espera si el evento está lleno
- ✅ Categorías de eventos
- ✅ Eventos públicos vs privados

#### **Módulo de Voluntarios**
- ✅ Registro de voluntarios
- ✅ Perfil de voluntario
- ✅ Eventos que requieren voluntarios
- ✅ Registro de voluntarios para eventos específicos
- ✅ Historial de voluntariado
- ✅ Horas de servicio comunitario (opcional)

#### **Módulo de Usuarios y Autenticación**
- ✅ Registro de usuarios
- ✅ Login/Logout
- ✅ Recuperación de contraseña
- ✅ Perfil de usuario
- ✅ Roles y permisos (Admin, Estudiante, Voluntario)
- ✅ Gestión de usuarios por administradores

#### **Módulo de Dashboard/Reportes**
- ✅ Dashboard para administradores
- ✅ Estadísticas de registros por semestre
- ✅ Estadísticas de eventos
- ✅ Estadísticas de voluntarios
- ✅ Gráficos y métricas

---

## 🏗️ Arquitectura del Sistema

### Estructura del Proyecto

```
iyforlando_mono_2026/
├── iyf_backend_2026/          # Frontend Angular
│   ├── src/
│   │   ├── app/
│   │   │   ├── modules/
│   │   │   │   ├── admin/     # Panel administrativo
│   │   │   │   ├── student/   # Módulo de estudiantes
│   │   │   │   ├── volunteer/ # Módulo de voluntarios
│   │   │   │   └── public/    # Páginas públicas
│   │   │   ├── core/          # Servicios core
│   │   │   └── shared/       # Componentes compartidos
│   │   └── ...
│   └── ...
├── iyf_api_2026/              # Backend API (por crear)
│   ├── src/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── routes/
│   │   ├── middleware/
│   │   └── services/
│   └── ...
└── docs/                      # Documentación
```

### Flujo de Datos

```
Frontend (Angular) 
    ↕ HTTP/REST API
Backend (API)
    ↕ ORM/Driver
Base de Datos
```

---

## 📦 Funcionalidades Principales

### 1. Módulo de Academias

#### Funcionalidades para Administradores
- **Gestión de Semestres**
  - Crear semestres (Fall 2026, Spring 2027, etc.)
  - Definir fechas de inicio y fin
  - Definir fechas de registro
  - Activar/desactivar semestres

- **Gestión de Cursos**
  - Crear cursos dentro de academias
  - Asignar instructores
  - Definir horarios (días, horas)
  - Establecer capacidad máxima
  - Subir materiales del curso
  - Definir requisitos previos (opcional)

- **Gestión de Estudiantes**
  - Ver lista de estudiantes registrados
  - Aprobar/rechazar registros
  - Gestionar lista de espera
  - Enviar notificaciones

#### Funcionalidades para Estudiantes
- Ver academias disponibles
- Ver cursos disponibles por semestre
- Registrarse en cursos
- Ver sus cursos inscritos
- Ver materiales del curso
- Descargar certificados

### 2. Módulo de Eventos

#### Funcionalidades para Administradores
- Crear eventos
- Definir detalles (nombre, descripción, fecha, hora, ubicación)
- Establecer capacidad máxima
- Definir si requiere voluntarios
- Gestionar registros de participantes
- Gestionar registros de voluntarios
- Enviar recordatorios

#### Funcionalidades para Usuarios
- Ver eventos disponibles
- Filtrar eventos por fecha, categoría
- Registrarse en eventos
- Ver eventos en los que está registrado
- Cancelar registro (si está permitido)

### 3. Módulo de Voluntarios

#### Funcionalidades para Administradores
- Ver lista de voluntarios registrados
- Asignar voluntarios a eventos
- Ver historial de voluntarios
- Generar reportes de horas de servicio

#### Funcionalidades para Voluntarios
- Registrarse como voluntario
- Completar perfil de voluntario
- Ver eventos que requieren voluntarios
- Registrarse para eventos como voluntario
- Ver historial de voluntariado

### 4. Módulo de Dashboard

#### Dashboard Administrativo
- **Métricas Principales**
  - Total de estudiantes registrados (por semestre)
  - Total de eventos este mes/año
  - Total de voluntarios activos
  - Cursos más populares
  - Eventos más populares

- **Gráficos**
  - Registros por mes
  - Distribución de estudiantes por curso
  - Asistencia a eventos
  - Participación de voluntarios

- **Accesos Rápidos**
  - Crear nuevo curso
  - Crear nuevo evento
  - Ver registros pendientes
  - Ver notificaciones

---

## 🗄️ Estructura de Base de Datos

### Tablas Principales

#### **users**
```sql
- id (PK)
- email (unique)
- password (hashed)
- first_name
- last_name
- phone
- role (admin, student, volunteer)
- status (active, inactive)
- email_verified
- created_at
- updated_at
```

#### **semesters**
```sql
- id (PK)
- name (e.g., "Fall 2026")
- start_date
- end_date
- registration_start_date
- registration_end_date
- status (upcoming, active, completed)
- created_at
- updated_at
```

#### **academies**
```sql
- id (PK)
- name
- description
- status (active, inactive)
- created_at
- updated_at
```

#### **courses**
```sql
- id (PK)
- academy_id (FK)
- semester_id (FK)
- name
- description
- instructor_id (FK -> users)
- schedule (JSON: days, times)
- max_capacity
- current_enrollment
- status (open, full, closed)
- created_at
- updated_at
```

#### **course_registrations**
```sql
- id (PK)
- course_id (FK)
- user_id (FK)
- semester_id (FK)
- status (pending, approved, rejected, waitlisted)
- registered_at
- approved_at
- approved_by (FK -> users)
- notes
- created_at
- updated_at
```

#### **events**
```sql
- id (PK)
- title
- description
- event_date
- event_time
- location
- max_participants
- current_participants
- requires_volunteers (boolean)
- max_volunteers
- current_volunteers
- category
- status (upcoming, ongoing, completed, cancelled)
- is_public (boolean)
- created_by (FK -> users)
- created_at
- updated_at
```

#### **event_registrations**
```sql
- id (PK)
- event_id (FK)
- user_id (FK)
- registration_type (participant, volunteer)
- status (pending, confirmed, cancelled, waitlisted)
- registered_at
- confirmed_at
- notes
- created_at
- updated_at
```

#### **volunteers**
```sql
- id (PK)
- user_id (FK, unique)
- skills (JSON array)
- availability (JSON)
- total_hours (default 0)
- status (active, inactive)
- created_at
- updated_at
```

#### **notifications**
```sql
- id (PK)
- user_id (FK)
- type (registration_approved, event_reminder, etc.)
- title
- message
- is_read (boolean)
- created_at
```

---

## 🔌 APIs y Endpoints

### Autenticación
```
POST   /api/auth/register
POST   /api/auth/login
POST   /api/auth/logout
POST   /api/auth/forgot-password
POST   /api/auth/reset-password
GET    /api/auth/me
```

### Semestres
```
GET    /api/semesters
GET    /api/semesters/:id
POST   /api/semesters (admin)
PUT    /api/semesters/:id (admin)
DELETE /api/semesters/:id (admin)
GET    /api/semesters/active
```

### Academias
```
GET    /api/academies
GET    /api/academies/:id
POST   /api/academies (admin)
PUT    /api/academies/:id (admin)
DELETE /api/academies/:id (admin)
```

### Cursos
```
GET    /api/courses
GET    /api/courses/:id
GET    /api/courses/semester/:semesterId
POST   /api/courses (admin)
PUT    /api/courses/:id (admin)
DELETE /api/courses/:id (admin)
GET    /api/courses/:id/students
```

### Registros de Cursos
```
GET    /api/course-registrations
GET    /api/course-registrations/:id
GET    /api/course-registrations/my-registrations
POST   /api/course-registrations
PUT    /api/course-registrations/:id/approve (admin)
PUT    /api/course-registrations/:id/reject (admin)
DELETE /api/course-registrations/:id
```

### Eventos
```
GET    /api/events
GET    /api/events/:id
GET    /api/events/upcoming
POST   /api/events (admin)
PUT    /api/events/:id (admin)
DELETE /api/events/:id (admin)
GET    /api/events/:id/participants
GET    /api/events/:id/volunteers
```

### Registros de Eventos
```
GET    /api/event-registrations
GET    /api/event-registrations/:id
GET    /api/event-registrations/my-registrations
POST   /api/event-registrations
PUT    /api/event-registrations/:id/cancel
DELETE /api/event-registrations/:id
```

### Voluntarios
```
GET    /api/volunteers
GET    /api/volunteers/:id
POST   /api/volunteers/register
PUT    /api/volunteers/:id
GET    /api/volunteers/my-profile
```

### Dashboard
```
GET    /api/dashboard/stats (admin)
GET    /api/dashboard/registrations-chart (admin)
GET    /api/dashboard/events-chart (admin)
```

---

## 🎨 Personalización de la Plantilla

### Cambios Necesarios en el Frontend

#### 1. **Branding y Diseño**
- [ ] Cambiar logo por logo de IYF Orlando
- [ ] Cambiar colores del tema a colores de IYF
- [ ] Actualizar favicon
- [ ] Personalizar nombre de la aplicación

#### 2. **Navegación**
- [ ] Eliminar módulos no necesarios (Crypto, E-Commerce)
- [ ] Crear nueva estructura de navegación:
  - Dashboard
  - Academias
  - Eventos
  - Voluntarios
  - Mi Perfil
  - Configuración (admin)

#### 3. **Módulos a Adaptar**
- [ ] **Academy**: Adaptar para academias de IYF
- [ ] **Contacts**: Adaptar para gestión de estudiantes/voluntarios
- [ ] **Tasks**: Adaptar para gestión de eventos/tareas
- [ ] **Help Center**: Adaptar para FAQs de IYF

#### 4. **Módulos a Crear**
- [ ] Módulo de Registro de Estudiantes
- [ ] Módulo de Gestión de Eventos
- [ ] Módulo de Voluntarios
- [ ] Módulo de Dashboard personalizado

#### 5. **Páginas Públicas**
- [ ] Landing page de IYF Orlando
- [ ] Página "Sobre Nosotros"
- [ ] Página de Academias públicas
- [ ] Página de Eventos públicos

---

## ✅ Plan de Implementación

### Fase 1: Configuración Inicial y Backend Base
**Duración estimada: 1-2 semanas**

- [ ] Decidir stack del backend (Node.js/Express recomendado)
- [ ] Crear estructura del proyecto backend
- [ ] Configurar base de datos
- [ ] Implementar autenticación JWT
- [ ] Crear modelos base (User, Semester, Academy, Course, Event)
- [ ] Implementar CRUD básico para entidades principales
- [ ] Configurar CORS y middleware de seguridad

### Fase 2: Personalización del Frontend
**Duración estimada: 1 semana**

- [ ] Personalizar branding (logo, colores, nombre)
- [ ] Limpiar navegación (eliminar módulos no necesarios)
- [ ] Crear estructura de módulos (admin, student, volunteer, public)
- [ ] Configurar rutas principales
- [ ] Crear servicios base para comunicación con API

### Fase 3: Módulo de Academias
**Duración estimada: 2 semanas**

- [ ] Backend: APIs de semestres, academias y cursos
- [ ] Frontend: Gestión de semestres (admin)
- [ ] Frontend: Gestión de academias (admin)
- [ ] Frontend: Gestión de cursos (admin)
- [ ] Frontend: Vista pública de cursos disponibles
- [ ] Frontend: Sistema de registro de estudiantes
- [ ] Backend: Lógica de aprobación/rechazo de registros
- [ ] Frontend: Gestión de registros (admin)

### Fase 4: Módulo de Eventos
**Duración estimada: 1-2 semanas**

- [ ] Backend: APIs de eventos
- [ ] Frontend: Gestión de eventos (admin)
- [ ] Frontend: Vista pública de eventos
- [ ] Frontend: Sistema de registro de participantes
- [ ] Backend: Lógica de gestión de cupos
- [ ] Frontend: Gestión de registros de eventos (admin)

### Fase 5: Módulo de Voluntarios
**Duración estimada: 1 semana**

- [ ] Backend: APIs de voluntarios
- [ ] Frontend: Registro de voluntarios
- [ ] Frontend: Perfil de voluntario
- [ ] Frontend: Vista de eventos que requieren voluntarios
- [ ] Frontend: Registro de voluntarios para eventos
- [ ] Backend: Gestión de asignaciones de voluntarios

### Fase 6: Dashboard y Reportes
**Duración estimada: 1 semana**

- [ ] Backend: APIs de estadísticas
- [ ] Frontend: Dashboard administrativo
- [ ] Frontend: Gráficos y métricas
- [ ] Frontend: Reportes exportables (opcional)

### Fase 7: Notificaciones y Mejoras
**Duración estimada: 1 semana**

- [ ] Sistema de notificaciones (email/push)
- [ ] Recordatorios de eventos
- [ ] Confirmaciones de registro
- [ ] Mejoras de UX/UI
- [ ] Optimizaciones

### Fase 8: Testing y Deployment
**Duración estimada: 1 semana**

- [ ] Testing de funcionalidades
- [ ] Testing de seguridad
- [ ] Optimización de performance
- [ ] Configuración de producción
- [ ] Deployment
- [ ] Documentación final

---

## 📝 Checklist de Desarrollo

### Backend
- [ ] Estructura del proyecto creada
- [ ] Base de datos configurada
- [ ] Modelos creados
- [ ] Autenticación implementada
- [ ] Middleware de autorización
- [ ] APIs de Semestres
- [ ] APIs de Academias
- [ ] APIs de Cursos
- [ ] APIs de Registros de Cursos
- [ ] APIs de Eventos
- [ ] APIs de Registros de Eventos
- [ ] APIs de Voluntarios
- [ ] APIs de Dashboard
- [ ] Validación de datos
- [ ] Manejo de errores
- [ ] Logging
- [ ] Documentación de APIs

### Frontend
- [ ] Branding personalizado
- [ ] Navegación actualizada
- [ ] Módulo de Autenticación
- [ ] Módulo de Dashboard
- [ ] Módulo de Academias (Admin)
- [ ] Módulo de Registro de Estudiantes
- [ ] Módulo de Eventos (Admin)
- [ ] Módulo de Registro de Eventos
- [ ] Módulo de Voluntarios
- [ ] Páginas públicas
- [ ] Perfil de usuario
- [ ] Configuración (admin)
- [ ] Responsive design
- [ ] Manejo de errores
- [ ] Loading states
- [ ] Validación de formularios

### Testing
- [ ] Unit tests (backend)
- [ ] Unit tests (frontend)
- [ ] Integration tests
- [ ] E2E tests (opcional)
- [ ] Testing de seguridad
- [ ] Testing de performance

### Deployment
- [ ] Configuración de producción
- [ ] Variables de entorno
- [ ] SSL/HTTPS
- [ ] Backup de base de datos
- [ ] Monitoreo
- [ ] Documentación de deployment

---

## 🔐 Seguridad

### Consideraciones de Seguridad
- [ ] Autenticación JWT con refresh tokens
- [ ] Hash de contraseñas (bcrypt)
- [ ] Validación de inputs
- [ ] Protección CSRF
- [ ] Rate limiting
- [ ] Sanitización de datos
- [ ] Roles y permisos
- [ ] Logs de auditoría

---

## 📚 Documentación Adicional

### Para Desarrolladores
- Guía de instalación
- Guía de desarrollo
- Estructura del código
- Convenciones de código
- Guía de APIs

### Para Usuarios
- Manual de usuario (Admin)
- Manual de usuario (Estudiante)
- Manual de usuario (Voluntario)
- FAQs

---

## 📞 Contacto y Soporte

**Proyecto**: IYF Orlando Platform 2026
**Versión**: 1.0.0
**Última actualización**: 2026

---

## 📌 Notas Importantes

1. **Semestres**: El sistema debe manejar múltiples semestres simultáneamente (ej: algunos cursos en Fall, otros en Spring)

2. **Registros**: Los estudiantes pueden registrarse en múltiples cursos por semestre

3. **Eventos**: Los eventos pueden ser independientes de los semestres

4. **Voluntarios**: Pueden registrarse para múltiples eventos

5. **Notificaciones**: Es importante notificar a los usuarios sobre:
   - Aprobación/rechazo de registros
   - Recordatorios de eventos
   - Cambios en cursos/eventos

6. **Capacidad**: El sistema debe manejar listas de espera cuando los cursos/eventos están llenos

---

**Este documento será actualizado conforme avance el proyecto.**

