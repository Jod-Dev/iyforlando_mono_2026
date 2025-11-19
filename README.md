# IYF Orlando Platform 2026

## 📋 Descripción

Plataforma web completa para la gestión de academias, eventos y voluntarios de IYF Orlando (International Youth Fellowship Orlando).

Sistema desarrollado para gestionar:
- **Academias y Cursos**: Gestión de cursos por semestre con registro de estudiantes
- **Eventos**: Organización de eventos con registro de participantes
- **Voluntarios**: Gestión de voluntarios y sus asignaciones a eventos

## 📦 Requisitos

- **Node.js**: 18.0.0 o superior
- **npm**: 9.0.0 o superior
- **Angular CLI**: 19.0.0 o superior
- **Cuenta en Supabase**: (gratis) para base de datos y autenticación
- **Cuenta en Cloudflare**: (gratis) para hosting del frontend

## 🏗️ Arquitectura

### Frontend
- **Framework**: Angular 19
- **Plantilla**: Fuse Angular Admin Template
- **Estilos**: TailwindCSS + Angular Material
- **Ubicación**: `iyf_backend_2026/`

### Backend
- **Stack**: Supabase (Backend-as-a-Service)
- **Base de Datos**: PostgreSQL (gestionada por Supabase)
- **Autenticación**: Supabase Auth (JWT integrado)
- **APIs**: Auto-generadas por Supabase
- **Hosting**: Cloudflare Pages (Frontend)

## 🚀 Inicio Rápido

> ⚠️ **IMPORTANTE**: Antes de empezar, lee `INICIO_RAPIDO.md` para la guía completa de setup.

### Prerrequisitos
- Node.js 18+ y npm
- Angular CLI 19+
- Cuenta en Supabase (gratis)
- Cuenta en Cloudflare (gratis)
- Git configurado

### Setup Inicial (Una vez)

1. **Configurar Variables de Entorno**
   ```bash
   cp .env.example .env
   # Editar .env y completar con tus valores de Supabase
   ```

2. **Instalar Dependencias**
   ```bash
   # En la raíz
   npm install
   
   # En el frontend
   cd iyf_backend_2026
   npm install
   ```

3. **Configurar Husky (Pre-commit hooks)**
   ```bash
   # En la raíz
   npx husky install
   chmod +x .husky/pre-commit
   chmod +x .husky/commit-msg
   ```

4. **Verificar Configuración**
   ```bash
   # En la raíz
   npm run verify
   ```

### Desarrollo

```bash
cd iyf_backend_2026
npm start
```

La aplicación estará disponible en `http://localhost:4200`

### Configuración de Supabase

1. **Crear proyecto en Supabase**
   - Ir a [supabase.com](https://supabase.com)
   - Crear nuevo proyecto
   - Obtener URL y keys

2. **Configurar .env**
   - Completar `SUPABASE_URL` y `SUPABASE_ANON_KEY` en `.env`
   - Ver `VARIABLES_ENTORNO.md` para detalles

3. **Ejecutar scripts SQL**
   - Ver `GUIA_SUPABASE.md` para scripts de base de datos
   - Configurar RLS policies

4. **Instalar Supabase Client**
   ```bash
   cd iyf_backend_2026
   npm install @supabase/supabase-js
   ```

### Deploy en Cloudflare Pages

- Conectar repositorio
- Configurar build command: `npm run build`
- Configurar output directory: `dist/iyf-backend-2026/browser`
- Agregar variables de entorno (SUPABASE_URL, SUPABASE_ANON_KEY)

## 📚 Documentación

- **[Manual del Proyecto](./MANUAL_PROYECTO_IYF.md)**: Documentación completa del proyecto
- **[Plan de Acción](./PLAN_ACCION.md)**: Plan detallado de implementación
- **[Guía de Supabase](./GUIA_SUPABASE.md)**: Configuración completa de Supabase y Cloudflare Pages
- **[Restricciones del Proyecto](./restriction.md)**: ⚠️ **CHECKLIST COMPLETO DE RESTRICCIONES** - Debe seguirse en TODO el desarrollo
- **[✅ Estado de Restricciones](./ESTADO_RESTRICCIONES.md)**: Estado actual de aplicación de restricciones
- **[✅ Resumen de Aplicación](./RESUMEN_APLICACION_RESTRICCIONES.md)**: Resumen completo de restricciones aplicadas
- **[🚀 Inicio Rápido](./INICIO_RAPIDO.md)**: Guía paso a paso para empezar a desarrollar
- **[Automatización de Restricciones](./AUTOMATIZACION_RESTRICCIONES.md)**: 🚀 **Scripts y herramientas que verifican restricciones automáticamente**
- **[Integración de Restricciones](./INTEGRACION_RESTRICCIONES.md)**: Cómo integrar las restricciones en el desarrollo
- **[Checklist de Restricciones por Fase](./CHECKLIST_RESTRICCIONES_POR_FASE.md)**: Checklists específicos para cada fase
- **[Variables de Entorno](./VARIABLES_ENTORNO.md)**: Configuración de variables de entorno
- **[Plan Pendiente](./PLAN_PENDIENTE.md)**: Áreas que aún necesitan planificación detallada
- **[Análisis de Restricciones](./ANALISIS_RESTRICCIONES.md)**: Análisis del restriction.md y qué falta implementar
- **[Diagramas de Flujos](./DIAGRAMAS_FLUJOS.md)**: Diagramas visuales de los flujos principales
- **[Checklist Inicial](./CHECKLIST_INICIAL.md)**: Checklist completo de tareas

## 🎯 Funcionalidades Principales

### Para Administradores
- ✅ Gestión de semestres, academias y cursos
- ✅ Aprobar/rechazar registros de estudiantes
- ✅ Gestión de eventos
- ✅ Gestión de voluntarios
- ✅ Dashboard con estadísticas
- ✅ Reportes y métricas

### Para Estudiantes
- ✅ Ver cursos disponibles por semestre
- ✅ Registrarse en cursos
- ✅ Ver sus cursos inscritos
- ✅ Registrarse en eventos
- ✅ Ver historial académico

### Para Voluntarios
- ✅ Registrarse como voluntario
- ✅ Ver eventos que requieren voluntarios
- ✅ Registrarse para eventos
- ✅ Ver historial de voluntariado
- ✅ Ver horas de servicio

## 🔐 Autenticación

El sistema utiliza **Supabase Auth** que proporciona:
- Login/Logout con email y contraseña
- Registro de usuarios
- Recuperación de contraseña
- Magic Links (opcional)
- OAuth (Google, GitHub, etc.) - opcional
- JWT tokens automáticos
- Row Level Security (RLS) para control de acceso
- Roles: Admin, Estudiante, Voluntario

## 📦 Estructura del Proyecto

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
├── MANUAL_PROYECTO_IYF.md    # Manual completo
├── PLAN_ACCION.md             # Plan de implementación
└── README.md                  # Este archivo
```

## 🗄️ Base de Datos

### Entidades Principales
- **Users**: Usuarios del sistema
- **Semesters**: Semestres académicos
- **Academies**: Academias
- **Courses**: Cursos
- **Course_Registrations**: Registros de estudiantes
- **Events**: Eventos
- **Event_Registrations**: Registros de eventos
- **Volunteers**: Voluntarios

Ver [Manual del Proyecto](./MANUAL_PROYECTO_IYF.md) para el esquema completo.

## 🔌 APIs

Supabase genera automáticamente APIs REST para todas las tablas. Los endpoints siguen este patrón:

- `POST /rest/v1/{table}` - Crear
- `GET /rest/v1/{table}` - Listar (con filtros, ordenamiento, paginación)
- `GET /rest/v1/{table}?id=eq.{id}` - Obtener por ID
- `PATCH /rest/v1/{table}?id=eq.{id}` - Actualizar
- `DELETE /rest/v1/{table}?id=eq.{id}` - Eliminar

### Tablas Principales
- `profiles` - Perfiles de usuario
- `semesters` - Semestres
- `academies` - Academias
- `courses` - Cursos
- `course_registrations` - Registros de cursos
- `events` - Eventos
- `event_registrations` - Registros de eventos
- `volunteers` - Voluntarios

Ver [Guía de Supabase](./GUIA_SUPABASE.md) para detalles de implementación.

## 🧪 Testing

```bash
# Frontend
npm test
```

Nota: Con Supabase, las pruebas de backend se realizan principalmente a través de las políticas RLS y funciones de base de datos.

## 📝 Convenciones de Código

- **Frontend**: TypeScript, Angular Style Guide
- **Backend**: Por definir
- **Commits**: Conventional Commits
- **Branches**: Git Flow

## 🚢 Deployment

### Producción
- Frontend: Netlify/Vercel/AWS S3
- Backend: Heroku/AWS/DigitalOcean
- Base de Datos: AWS RDS/Heroku Postgres

### Variables de Entorno
- `SUPABASE_URL`: URL del proyecto Supabase
- `SUPABASE_ANON_KEY`: Anon key pública de Supabase
- `SUPABASE_SERVICE_ROLE_KEY`: Service role key (solo para Edge Functions, NUNCA en frontend)

## 🤝 Contribución

1. Crear una rama para la funcionalidad
2. Hacer commits descriptivos
3. Crear un Pull Request
4. Esperar revisión

## 📄 Licencia

Este proyecto es propiedad de IYF Orlando.

## 📞 Contacto

Para preguntas o soporte, contactar al equipo de desarrollo.

---

**Versión**: 1.0.0  
**Última actualización**: 2026

