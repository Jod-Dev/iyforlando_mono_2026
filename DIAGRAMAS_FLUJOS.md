# Diagramas de Flujos - IYF Orlando 2026

## 🔄 Flujo de Registro de Estudiante a Curso

```
┌─────────────┐
│   Usuario   │
│  (Login)    │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  Navega a           │
│  "Academias"        │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Selecciona         │
│  Semestre           │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Ve Lista de        │
│  Cursos Disponibles │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Selecciona Curso   │
│  y Ve Detalles      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Hace Clic en       │
│  "Registrarse"      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Sistema Valida     │
│  Cupos Disponibles  │
└──────┬──────────────┘
       │
       ├─── Hay Cupo ──────────┐
       │                       │
       └─── No Hay Cupo ───────┘
              │                    │
              ▼                    ▼
    ┌─────────────────┐  ┌─────────────────────┐
    │ Registro        │  │ Se Agrega a        │
    │ Pendiente de    │  │ Lista de Espera    │
    │ Aprobación      │  │                    │
    └────────┬────────┘  └─────────┬─────────┘
             │                      │
             │                      │
             └──────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Admin Recibe        │
              │ Notificación        │
              └──────────┬──────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │ Admin Aprueba/      │
              │ Rechaza Registro    │
              └──────────┬──────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │ Estudiante Recibe   │
              │ Notificación        │
              └─────────────────────┘
```

## 🎉 Flujo de Registro a Evento

```
┌─────────────┐
│   Usuario   │
│ (Login/Opc) │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  Navega a           │
│  "Eventos"          │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Ve Lista de        │
│  Eventos            │
│  (Filtra por fecha) │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Selecciona Evento  │
│  y Ve Detalles      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Hace Clic en       │
│  "Registrarse"      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Sistema Valida     │
│  Cupos Disponibles  │
└──────┬──────────────┘
       │
       ├─── Hay Cupo ──────────┐
       │                       │
       └─── No Hay Cupo ───────┘
              │                    │
              ▼                    ▼
    ┌─────────────────┐  ┌─────────────────────┐
    │ Registro        │  │ Se Agrega a        │
    │ Confirmado      │  │ Lista de Espera    │
    │                 │  │                    │
    └────────┬────────┘  └─────────┬─────────┘
             │                      │
             │                      │
             └──────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Usuario Recibe      │
              │ Confirmación         │
              └──────────┬──────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │ Recibe Recordatorio  │
              │ Días Antes del Evento│
              └─────────────────────┘
```

## 👥 Flujo de Registro como Voluntario

```
┌─────────────┐
│   Usuario   │
│  (Login)    │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  Navega a           │
│  "Voluntarios"      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Hace Clic en       │
│  "Registrarse como  │
│  Voluntario"        │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Completa Formulario│
│  - Skills           │
│  - Availability     │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Perfil de          │
│  Voluntario Creado  │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Ve Eventos que     │
│  Requieren          │
│  Voluntarios        │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Selecciona Evento  │
│  y Se Registra      │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Admin Aprueba      │
│  Asignación         │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Voluntario Recibe  │
│  Confirmación       │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Después del Evento │
│  Horas de Servicio  │
│  Se Actualizan      │
└─────────────────────┘
```

## 🏗️ Arquitectura del Sistema

```
┌─────────────────────────────────────────────────────────┐
│                    FRONTEND (Angular)                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │  Admin   │  │ Student   │  │Volunteer  │  │ Public ││
│  │  Module  │  │  Module   │  │  Module   │  │ Module ││
│  └──────────┘  └──────────┘  └──────────┘  └────────┘│
│                                                         │
│  ┌──────────────────────────────────────────────────┐ │
│  │         Services & HTTP Interceptors              │ │
│  └──────────────────────────────────────────────────┘ │
└───────────────────────┬───────────────────────────────┘
                        │
                        │ HTTP/REST API
                        │ (JWT Authentication)
                        │
┌───────────────────────▼───────────────────────────────┐
│              BACKEND API (Node.js/Express)             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐           │
│  │  Auth    │  │  Courses  │  │  Events   │           │
│  │Controller│  │Controller │  │Controller │           │
│  └──────────┘  └──────────┘  └──────────┘           │
│                                                         │
│  ┌──────────────────────────────────────────────────┐ │
│  │         Middleware (Auth, Validation, etc.)      │ │
│  └──────────────────────────────────────────────────┘ │
│                                                         │
│  ┌──────────────────────────────────────────────────┐ │
│  │         Services (Business Logic)                │ │
│  └──────────────────────────────────────────────────┘ │
└───────────────────────┬───────────────────────────────┘
                        │
                        │ ORM/Driver
                        │
┌───────────────────────▼───────────────────────────────┐
│              BASE DE DATOS (PostgreSQL)                │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐           │
│  │  Users   │  │  Courses  │  │  Events   │           │
│  │Semesters │  │Registrations│ │Registrations│         │
│  │Volunteers│  │            │  │            │           │
│  └──────────┘  └──────────┘  └──────────┘           │
└───────────────────────────────────────────────────────┘
```

## 🔐 Flujo de Autenticación

```
┌─────────────┐
│   Usuario   │
└──────┬──────┘
       │
       ├─── Login ───────────────┐
       │                         │
       ├─── Register ───────────┤
       │                         │
       └─── Forgot Password ────┤
                                 │
                                 ▼
                    ┌─────────────────────┐
                    │  Frontend Envía     │
                    │  Credenciales       │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Backend Valida     │
                    │  Credenciales       │
                    └──────────┬──────────┘
                               │
                               ├─── Válido ───────┐
                               │                  │
                               └─── Inválido ─────┘
                                      │              │
                                      │              │
                                      ▼              ▼
                         ┌─────────────────┐  ┌──────────────┐
                         │ Genera JWT      │  │ Retorna      │
                         │ Token           │  │ Error        │
                         └────────┬────────┘  └──────────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │ Frontend        │
                         │ Almacena Token  │
                         │ en LocalStorage │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │ Usuario         │
                         │ Autenticado     │
                         └─────────────────┘
```

## 📊 Flujo de Dashboard Administrativo

```
┌─────────────┐
│   Admin     │
│  (Login)    │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  Accede a Dashboard │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Sistema Calcula    │
│  Estadísticas:      │
│  - Total Estudiantes│
│  - Total Eventos    │
│  - Total Voluntarios│
│  - Cursos Populares │
└──────┬──────────────┘
       │
       ▼
┌─────────────────────┐
│  Muestra Dashboard  │
│  con Gráficos y     │
│  Métricas           │
└──────┬──────────────┘
       │
       ├─── Ver Detalles ────┐
       │                     │
       ├─── Crear Curso ─────┤
       │                     │
       ├─── Crear Evento ────┤
       │                     │
       └─── Ver Reportes ────┤
                             │
                             ▼
                  ┌─────────────────────┐
                  │  Acción Específica   │
                  └─────────────────────┘
```

## 🎓 Flujo de Gestión de Cursos (Admin)

```
┌─────────────┐
│   Admin     │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  Navega a           │
│  "Gestión Cursos"  │
└──────┬──────────────┘
       │
       ├─── Crear Curso ───────────┐
       │                            │
       ├─── Editar Curso ───────────┤
       │                            │
       ├─── Ver Registros ──────────┤
       │                            │
       └─── Eliminar Curso ────────┤
                                   │
                                   ▼
                    ┌─────────────────────┐
                    │  Formulario/Acción  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Backend Procesa    │
                    │  y Valida           │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Base de Datos     │
                    │  Actualizada        │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │  Frontend Actualiza │
                    │  Vista              │
                    └─────────────────────┘
```

## 📧 Flujo de Notificaciones

```
┌─────────────────────┐
│  Evento en el        │
│  Sistema            │
│  (Registro, Aprob,  │
│   Recordatorio)     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Sistema Crea       │
│  Notificación       │
└──────────┬──────────┘
           │
           ├─── Notificación en App ────┐
           │                             │
           └─── Email ────────────────────┤
                                          │
                                          ▼
                              ┌─────────────────────┐
                              │  Usuario Recibe     │
                              │  Notificación       │
                              └─────────────────────┘
```

---

**Nota**: Estos diagramas representan los flujos principales del sistema. Se actualizarán conforme se desarrolle el proyecto.

