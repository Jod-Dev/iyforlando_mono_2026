# Variables de Entorno - IYF Orlando 2026

Este documento describe todas las variables de entorno necesarias para el proyecto.

---

## 📋 Variables Requeridas

### Supabase

#### `SUPABASE_URL`
- **Descripción**: URL de tu proyecto Supabase
- **Formato**: `https://xxxxxxxxxxxxx.supabase.co`
- **Dónde obtener**: Dashboard de Supabase > Settings > API > Project URL
- **Uso**: Frontend y Backend
- **Seguridad**: ✅ Seguro para exponer en frontend

#### `SUPABASE_ANON_KEY`
- **Descripción**: Anon Key (Public Key) de Supabase
- **Formato**: String largo (JWT)
- **Dónde obtener**: Dashboard de Supabase > Settings > API > anon public
- **Uso**: Frontend (Angular)
- **Seguridad**: ✅ Seguro para exponer en frontend (RLS protege los datos)

#### `SUPABASE_SERVICE_ROLE_KEY`
- **Descripción**: Service Role Key (Secret Key) de Supabase
- **Formato**: String largo (JWT)
- **Dónde obtener**: Dashboard de Supabase > Settings > API > service_role secret
- **Uso**: Solo en Edge Functions o backend (NUNCA en frontend)
- **Seguridad**: ⚠️ **NUNCA exponer en frontend** - Solo en servidor

---

## 🔧 Configuración

### Paso 1: Crear archivo .env

```bash
# En la raíz del proyecto
cp .env.example .env
```

### Paso 2: Completar valores

Edita el archivo `.env` y completa los valores:

```bash
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-anon-key-aqui
SUPABASE_SERVICE_ROLE_KEY=tu-service-role-key-aqui
```

### Paso 3: Verificar que .env está en .gitignore

```bash
# Verificar que .env está ignorado
git check-ignore .env
# Debe mostrar: .env
```

---

## 📝 Variables Opcionales

### Email Service

Si usas un servicio de email externo:

```bash
# SendGrid
SENDGRID_API_KEY=your_sendgrid_key

# Mailgun
MAILGUN_API_KEY=your_mailgun_key
```

### Monitoring

```bash
# Sentry
SENTRY_DSN=your_sentry_dsn

# LogRocket
LOGROCKET_ID=your_logrocket_id
```

---

## 🔐 Seguridad

### ✅ Hacer:
- ✅ Usar `.env.example` como template
- ✅ Agregar `.env` a `.gitignore`
- ✅ Usar `SUPABASE_ANON_KEY` en frontend
- ✅ Usar `SUPABASE_SERVICE_ROLE_KEY` solo en Edge Functions

### ❌ NO Hacer:
- ❌ Commitear archivo `.env`
- ❌ Exponer `SUPABASE_SERVICE_ROLE_KEY` en frontend
- ❌ Hardcodear secrets en código
- ❌ Compartir secrets en mensajes o chats

---

## 🚀 Uso en Desarrollo

### Angular (Frontend)

Las variables se cargan desde `environment.ts`:

```typescript
import { environment } from './environments/environment';

const supabase = createClient(
  environment.supabaseUrl,
  environment.supabaseAnonKey
);
```

### Supabase Edge Functions

Las variables están disponibles automáticamente:

```typescript
const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
```

---

## 📚 Referencias

- [Supabase Environment Variables](https://supabase.com/docs/guides/getting-started/local-development#environment-variables)
- [Angular Environment Configuration](https://angular.io/guide/build#configuring-application-environments)

---

**Última actualización**: 2026

