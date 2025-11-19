# Checklist Inicial - IYF Orlando 2026

## ✅ Checklist de Configuración Inicial

### Decisión de Stack Tecnológico
- [x] Backend: Supabase (Backend-as-a-Service)
- [x] Base de datos: PostgreSQL (gestionada por Supabase)
- [x] Hosting Frontend: Cloudflare Pages
- [ ] Decidir servicio de email (Supabase tiene email integrado, o SendGrid, Mailgun, etc.)

### Configuración del Proyecto
- [ ] Crear repositorio Git (si no existe)
- [ ] Configurar .gitignore
- [ ] Crear estructura de carpetas del backend
- [ ] Configurar variables de entorno (.env)
- [ ] Configurar README.md

### Supabase - Configuración
- [ ] Crear cuenta en Supabase
- [ ] Crear nuevo proyecto
- [ ] Obtener Project URL y Anon Key
- [ ] Ejecutar scripts SQL para crear tablas (ver GUIA_SUPABASE.md)
- [ ] Configurar Row Level Security (RLS) en todas las tablas
- [ ] Crear políticas de seguridad
- [ ] Crear funciones de base de datos (triggers, etc.)
- [ ] Configurar autenticación en Supabase Dashboard
- [ ] Probar conexión desde Angular

### Frontend - Integración con Supabase
- [ ] Instalar @supabase/supabase-js
- [ ] Crear servicio de Supabase
- [ ] Configurar variables de entorno (environment.ts)
- [ ] Actualizar servicio de autenticación para usar Supabase
- [ ] Crear servicios para cada módulo (courses, events, etc.)
- [ ] Configurar interceptores HTTP (si es necesario)

### Frontend - Personalización Básica
- [ ] Cambiar logo de la aplicación
- [ ] Cambiar favicon
- [ ] Actualizar colores del tema
- [ ] Cambiar nombre de la aplicación
- [ ] Actualizar metadata (title, description)

### Frontend - Limpieza
- [ ] Eliminar módulos no necesarios de la navegación
- [ ] Ocultar/eliminar módulos: Crypto, E-Commerce (si no se usan)
- [ ] Limpiar rutas no utilizadas
- [ ] Actualizar navegación principal

### Frontend - Estructura
- [ ] Crear módulo `admin`
- [ ] Crear módulo `student`
- [ ] Crear módulo `volunteer`
- [ ] Crear módulo `public`
- [ ] Configurar rutas base de cada módulo
- [ ] Crear servicios base (HTTP, Auth)

### Frontend - Servicios
- [ ] Crear servicio de autenticación
- [ ] Crear servicio HTTP base
- [ ] Configurar interceptores HTTP
- [ ] Configurar manejo de errores global
- [ ] Configurar loading states

### Testing Inicial
- [ ] Probar registro de usuario
- [ ] Probar login de usuario
- [ ] Probar logout
- [ ] Probar recuperación de contraseña
- [ ] Verificar que el frontend se conecta al backend

### Documentación
- [ ] Revisar y actualizar README.md
- [ ] Documentar variables de entorno
- [ ] Documentar estructura del proyecto
- [ ] Crear guía de instalación

---

## 🎯 Checklist de Funcionalidades Core

### Módulo de Semestres
- [ ] Backend: Modelo Semester
- [ ] Backend: CRUD de semestres
- [ ] Frontend: Lista de semestres (admin)
- [ ] Frontend: Formulario crear/editar semestre
- [ ] Frontend: Activar/desactivar semestre

### Módulo de Academias
- [ ] Backend: Modelo Academy
- [ ] Backend: CRUD de academias
- [ ] Frontend: Lista de academias (admin)
- [ ] Frontend: Formulario crear/editar academia

### Módulo de Cursos
- [ ] Backend: Modelo Course
- [ ] Backend: CRUD de cursos
- [ ] Backend: Validación de capacidad
- [ ] Frontend: Lista de cursos (admin)
- [ ] Frontend: Formulario crear/editar curso
- [ ] Frontend: Vista pública de cursos
- [ ] Frontend: Detalle de curso

### Módulo de Registros de Cursos
- [ ] Backend: Modelo CourseRegistration
- [ ] Backend: API de registro
- [ ] Backend: Lógica de aprobación
- [ ] Backend: Lógica de lista de espera
- [ ] Frontend: Formulario de registro
- [ ] Frontend: Vista "Mis Cursos"
- [ ] Frontend: Gestión de registros (admin)

### Módulo de Eventos
- [ ] Backend: Modelo Event
- [ ] Backend: CRUD de eventos
- [ ] Backend: Validación de capacidad
- [ ] Frontend: Lista de eventos (admin)
- [ ] Frontend: Formulario crear/editar evento
- [ ] Frontend: Vista pública de eventos
- [ ] Frontend: Detalle de evento

### Módulo de Registros de Eventos
- [ ] Backend: Modelo EventRegistration
- [ ] Backend: API de registro
- [ ] Backend: Lógica de lista de espera
- [ ] Frontend: Formulario de registro
- [ ] Frontend: Vista "Mis Eventos"
- [ ] Frontend: Gestión de registros (admin)

### Módulo de Voluntarios
- [ ] Backend: Modelo Volunteer
- [ ] Backend: API de registro de voluntarios
- [ ] Backend: API de asignación a eventos
- [ ] Frontend: Formulario de registro
- [ ] Frontend: Perfil de voluntario
- [ ] Frontend: Vista de eventos que requieren voluntarios
- [ ] Frontend: Gestión de voluntarios (admin)

### Dashboard
- [ ] Backend: APIs de estadísticas
- [ ] Frontend: Dashboard administrativo
- [ ] Frontend: Gráficos y métricas
- [ ] Frontend: Dashboard de usuario

---

## 🔒 Checklist de Seguridad

- [ ] Validación de inputs en backend
- [ ] Sanitización de datos
- [ ] Protección CSRF
- [ ] Rate limiting
- [ ] Hash de contraseñas (bcrypt)
- [ ] JWT con expiración
- [ ] Refresh tokens
- [ ] Validación de roles y permisos
- [ ] Logs de auditoría
- [ ] Manejo seguro de errores (no exponer información sensible)

---

## 📱 Checklist de UX/UI

- [ ] Diseño responsive (móvil, tablet, desktop)
- [ ] Loading states en todas las acciones
- [ ] Mensajes de error claros y útiles
- [ ] Mensajes de éxito
- [ ] Confirmaciones para acciones importantes
- [ ] Validación de formularios en tiempo real
- [ ] Navegación intuitiva
- [ ] Accesibilidad básica

---

## 📧 Checklist de Notificaciones

- [ ] Configurar servicio de email
- [ ] Template de email de confirmación de registro
- [ ] Template de email de aprobación de registro
- [ ] Template de email de recordatorio de evento
- [ ] Template de email de notificación de cupo disponible
- [ ] Sistema de notificaciones en la app
- [ ] Badge de notificaciones no leídas

---

## 🧪 Checklist de Testing

- [ ] Unit tests de modelos (backend)
- [ ] Unit tests de servicios (backend)
- [ ] Integration tests de APIs
- [ ] Unit tests de componentes (frontend)
- [ ] Unit tests de servicios (frontend)
- [ ] Testing de autenticación
- [ ] Testing de autorización
- [ ] Testing de flujos principales

---

## 🚀 Checklist de Deployment

- [ ] Configurar variables de entorno de producción
- [ ] Configurar base de datos de producción
- [ ] Configurar SSL/HTTPS
- [ ] Configurar dominio
- [ ] Deploy del backend
- [ ] Deploy del frontend
- [ ] Configurar backup de base de datos
- [ ] Configurar monitoreo
- [ ] Configurar logs de producción
- [ ] Testing en producción

---

## 📚 Checklist de Documentación Final

- [ ] Manual de usuario (Admin)
- [ ] Manual de usuario (Estudiante)
- [ ] Manual de usuario (Voluntario)
- [ ] Documentación de APIs
- [ ] Guía de instalación
- [ ] Guía de desarrollo
- [ ] README actualizado

---

## 🎉 Checklist de Lanzamiento

- [ ] Todas las funcionalidades core implementadas
- [ ] Testing completo
- [ ] Documentación completa
- [ ] Deployment en producción
- [ ] Backup configurado
- [ ] Monitoreo configurado
- [ ] Usuarios de prueba creados
- [ ] Capacitación a administradores
- [ ] Comunicación a usuarios

---

**Este checklist será actualizado conforme avance el proyecto.**

