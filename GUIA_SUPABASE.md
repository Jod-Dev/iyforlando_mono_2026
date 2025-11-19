# Guía de Configuración - Supabase + Cloudflare Pages

## 🎯 Stack Tecnológico Decidido

- **Frontend**: Angular 19 (Plantilla Fuse Angular)
- **Backend**: Supabase (Backend-as-a-Service)
  - Base de datos: PostgreSQL (gestionada por Supabase)
  - Autenticación: Supabase Auth (JWT integrado)
  - APIs REST: Auto-generadas por Supabase
  - Edge Functions: Para lógica de negocio compleja (opcional)
- **Hosting Frontend**: Cloudflare Pages
- **Storage**: Supabase Storage (para archivos/documentos)

---

## 🚀 Ventajas de Usar Supabase

### ✅ Lo que Supabase Proporciona Automáticamente

1. **Base de Datos PostgreSQL**
   - Base de datos PostgreSQL completa
   - Migraciones automáticas
   - Editor SQL integrado
   - Backups automáticos

2. **Autenticación Completa**
   - Registro/Login con email
   - OAuth (Google, GitHub, etc.)
   - Magic Links
   - Recuperación de contraseña
   - JWT tokens automáticos
   - Row Level Security (RLS)

3. **APIs REST Automáticas**
   - APIs REST auto-generadas para todas las tablas
   - Filtros, ordenamiento, paginación automáticos
   - No necesitas escribir endpoints manualmente

4. **Row Level Security (RLS)**
   - Control de acceso a nivel de fila
   - Políticas de seguridad en la base de datos
   - Perfecto para roles y permisos

5. **Realtime**
   - Suscripciones en tiempo real
   - Notificaciones instantáneas
   - Actualizaciones en vivo

6. **Storage**
   - Almacenamiento de archivos
   - Perfecto para documentos, imágenes, etc.

---

## 📦 Instalación y Configuración

### 1. Crear Proyecto en Supabase

1. Ir a [supabase.com](https://supabase.com)
2. Crear cuenta (gratis hasta cierto límite)
3. Crear nuevo proyecto
4. Anotar:
   - Project URL
   - Anon Key (public key)
   - Service Role Key (secret, solo backend)

### 2. Instalar Supabase Client en Angular

```bash
cd iyf_backend_2026
npm install @supabase/supabase-js
```

### 3. Configurar Variables de Entorno

Crear archivo `src/environments/environment.ts`:

```typescript
export const environment = {
  production: false,
  supabaseUrl: 'https://tu-proyecto.supabase.co',
  supabaseAnonKey: 'tu-anon-key-aqui'
};
```

Crear archivo `src/environments/environment.prod.ts`:

```typescript
export const environment = {
  production: true,
  supabaseUrl: 'https://tu-proyecto.supabase.co',
  supabaseAnonKey: 'tu-anon-key-aqui'
};
```

### 4. Crear Servicio de Supabase

Crear `src/app/core/supabase/supabase.service.ts`:

```typescript
import { Injectable } from '@angular/core';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SupabaseService {
  private supabase: SupabaseClient;

  constructor() {
    this.supabase = createClient(
      environment.supabaseUrl,
      environment.supabaseAnonKey
    );
  }

  get client(): SupabaseClient {
    return this.supabase;
  }

  // Métodos de autenticación
  async signUp(email: string, password: string, metadata?: any) {
    return await this.supabase.auth.signUp({
      email,
      password,
      options: {
        data: metadata
      }
    });
  }

  async signIn(email: string, password: string) {
    return await this.supabase.auth.signInWithPassword({
      email,
      password
    });
  }

  async signOut() {
    return await this.supabase.auth.signOut();
  }

  async getCurrentUser() {
    return await this.supabase.auth.getUser();
  }

  async resetPassword(email: string) {
    return await this.supabase.auth.resetPasswordForEmail(email);
  }

  // Obtener sesión actual
  getSession() {
    return this.supabase.auth.getSession();
  }

  // Observar cambios de autenticación
  onAuthStateChange(callback: (event: string, session: any) => void) {
    return this.supabase.auth.onAuthStateChange(callback);
  }
}
```

---

## 🗄️ Configuración de Base de Datos

### 1. Crear Tablas en Supabase

Ir a SQL Editor en Supabase Dashboard y ejecutar:

#### Tabla de Usuarios (extiende auth.users)
```sql
-- Perfil de usuario (extiende auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users PRIMARY KEY,
  email TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  role TEXT DEFAULT 'student' CHECK (role IN ('admin', 'student', 'volunteer')),
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar RLS
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Política: Usuarios pueden ver su propio perfil
CREATE POLICY "Users can view own profile"
  ON public.profiles FOR SELECT
  USING (auth.uid() = id);

-- Política: Usuarios pueden actualizar su propio perfil
CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  USING (auth.uid() = id);

-- Política: Admins pueden ver todos los perfiles
CREATE POLICY "Admins can view all profiles"
  ON public.profiles FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Semestres
```sql
CREATE TABLE public.semesters (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  registration_start_date DATE NOT NULL,
  registration_end_date DATE NOT NULL,
  status TEXT DEFAULT 'upcoming' CHECK (status IN ('upcoming', 'active', 'completed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.semesters ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden ver semestres activos
CREATE POLICY "Anyone can view active semesters"
  ON public.semesters FOR SELECT
  USING (status = 'active' OR status = 'upcoming');

-- Política: Solo admins pueden modificar
CREATE POLICY "Only admins can modify semesters"
  ON public.semesters FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Academias
```sql
CREATE TABLE public.academies (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academies ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden ver academias activas
CREATE POLICY "Anyone can view active academies"
  ON public.academies FOR SELECT
  USING (status = 'active');

-- Política: Solo admins pueden modificar
CREATE POLICY "Only admins can modify academies"
  ON public.academies FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Cursos
```sql
CREATE TABLE public.courses (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  academy_id UUID REFERENCES public.academies(id) ON DELETE CASCADE,
  semester_id UUID REFERENCES public.semesters(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  instructor_id UUID REFERENCES public.profiles(id),
  schedule JSONB, -- {days: ["Monday", "Wednesday"], times: "6:00 PM - 8:00 PM"}
  max_capacity INTEGER NOT NULL,
  current_enrollment INTEGER DEFAULT 0,
  status TEXT DEFAULT 'open' CHECK (status IN ('open', 'full', 'closed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden ver cursos abiertos
CREATE POLICY "Anyone can view open courses"
  ON public.courses FOR SELECT
  USING (status = 'open' OR status = 'full');

-- Política: Solo admins pueden modificar
CREATE POLICY "Only admins can modify courses"
  ON public.courses FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Registros de Cursos
```sql
CREATE TABLE public.course_registrations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  course_id UUID REFERENCES public.courses(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  semester_id UUID REFERENCES public.semesters(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'waitlisted')),
  registered_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  approved_at TIMESTAMP WITH TIME ZONE,
  approved_by UUID REFERENCES public.profiles(id),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(course_id, user_id, semester_id) -- Un usuario no puede registrarse dos veces al mismo curso en el mismo semestre
);

ALTER TABLE public.course_registrations ENABLE ROW LEVEL SECURITY;

-- Política: Usuarios pueden ver sus propios registros
CREATE POLICY "Users can view own registrations"
  ON public.course_registrations FOR SELECT
  USING (auth.uid() = user_id);

-- Política: Usuarios pueden crear sus propios registros
CREATE POLICY "Users can create own registrations"
  ON public.course_registrations FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Política: Admins pueden ver todos los registros
CREATE POLICY "Admins can view all registrations"
  ON public.course_registrations FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Política: Solo admins pueden actualizar registros
CREATE POLICY "Only admins can update registrations"
  ON public.course_registrations FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Eventos
```sql
CREATE TABLE public.events (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  location TEXT,
  max_participants INTEGER,
  current_participants INTEGER DEFAULT 0,
  requires_volunteers BOOLEAN DEFAULT FALSE,
  max_volunteers INTEGER,
  current_volunteers INTEGER DEFAULT 0,
  category TEXT,
  status TEXT DEFAULT 'upcoming' CHECK (status IN ('upcoming', 'ongoing', 'completed', 'cancelled')),
  is_public BOOLEAN DEFAULT TRUE,
  created_by UUID REFERENCES public.profiles(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden ver eventos públicos y próximos
CREATE POLICY "Anyone can view public upcoming events"
  ON public.events FOR SELECT
  USING (is_public = TRUE AND status = 'upcoming');

-- Política: Solo admins pueden modificar
CREATE POLICY "Only admins can modify events"
  ON public.events FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Registros de Eventos
```sql
CREATE TABLE public.event_registrations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  registration_type TEXT CHECK (registration_type IN ('participant', 'volunteer')),
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'cancelled', 'waitlisted')),
  registered_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  confirmed_at TIMESTAMP WITH TIME ZONE,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(event_id, user_id, registration_type)
);

ALTER TABLE public.event_registrations ENABLE ROW LEVEL SECURITY;

-- Política: Usuarios pueden ver sus propios registros
CREATE POLICY "Users can view own event registrations"
  ON public.event_registrations FOR SELECT
  USING (auth.uid() = user_id);

-- Política: Usuarios pueden crear sus propios registros
CREATE POLICY "Users can create own event registrations"
  ON public.event_registrations FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Política: Admins pueden ver todos los registros
CREATE POLICY "Admins can view all event registrations"
  ON public.event_registrations FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

#### Tabla de Voluntarios
```sql
CREATE TABLE public.volunteers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  skills JSONB, -- Array de habilidades
  availability JSONB, -- Disponibilidad
  total_hours INTEGER DEFAULT 0,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteers ENABLE ROW LEVEL SECURITY;

-- Política: Usuarios pueden ver su propio perfil de voluntario
CREATE POLICY "Users can view own volunteer profile"
  ON public.volunteers FOR SELECT
  USING (auth.uid() = user_id);

-- Política: Usuarios pueden crear su propio perfil de voluntario
CREATE POLICY "Users can create own volunteer profile"
  ON public.volunteers FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Política: Admins pueden ver todos los voluntarios
CREATE POLICY "Admins can view all volunteers"
  ON public.volunteers FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
```

### 2. Crear Función para Crear Perfil Automáticamente

```sql
-- Función que se ejecuta cuando se crea un usuario
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, role)
  VALUES (NEW.id, NEW.email, 'student');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger que se ejecuta después de insertar en auth.users
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

### 3. Crear Funciones para Actualizar Contadores

```sql
-- Función para actualizar current_enrollment cuando se aprueba un registro
CREATE OR REPLACE FUNCTION public.update_course_enrollment()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'approved' AND (OLD.status IS NULL OR OLD.status != 'approved') THEN
    UPDATE public.courses
    SET current_enrollment = current_enrollment + 1
    WHERE id = NEW.course_id;
  END IF;
  
  IF OLD.status = 'approved' AND NEW.status != 'approved' THEN
    UPDATE public.courses
    SET current_enrollment = current_enrollment - 1
    WHERE id = OLD.course_id;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER course_enrollment_trigger
  AFTER INSERT OR UPDATE ON public.course_registrations
  FOR EACH ROW EXECUTE FUNCTION public.update_course_enrollment();
```

---

## 🔧 Integración en Angular

### Actualizar Servicio de Autenticación

Modificar `src/app/core/auth/auth.service.ts` para usar Supabase:

```typescript
import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from, BehaviorSubject } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private supabaseService = inject(SupabaseService);
  private currentUserSubject = new BehaviorSubject<any>(null);

  constructor() {
    // Escuchar cambios de autenticación
    this.supabaseService.onAuthStateChange((event, session) => {
      if (session) {
        this.currentUserSubject.next(session.user);
      } else {
        this.currentUserSubject.next(null);
      }
    });

    // Cargar sesión actual
    this.supabaseService.getSession().then(({ data }) => {
      if (data.session) {
        this.currentUserSubject.next(data.session.user);
      }
    });
  }

  signIn(credentials: { email: string; password: string }): Observable<any> {
    return from(
      this.supabaseService.signIn(credentials.email, credentials.password)
    ).pipe(
      map((response) => {
        if (response.data.user) {
          this.currentUserSubject.next(response.data.user);
          return {
            user: response.data.user,
            accessToken: response.data.session?.access_token,
          };
        }
        throw new Error('Invalid credentials');
      })
    );
  }

  signUp(user: {
    name: string;
    email: string;
    password: string;
  }): Observable<any> {
    return from(
      this.supabaseService.signUp(user.email, user.password, {
        name: user.name,
      })
    );
  }

  signOut(): Observable<any> {
    return from(this.supabaseService.signOut()).pipe(
      map(() => {
        this.currentUserSubject.next(null);
        return true;
      })
    );
  }

  get currentUser$(): Observable<any> {
    return this.currentUserSubject.asObservable();
  }

  get accessToken(): string {
    // Supabase maneja los tokens automáticamente
    return '';
  }
}
```

### Crear Servicios para Datos

Ejemplo: `src/app/core/services/courses.service.ts`:

```typescript
import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class CoursesService {
  private supabase = inject(SupabaseService);

  getCourses(semesterId?: string): Observable<any[]> {
    let query = this.supabase.client
      .from('courses')
      .select('*, academies(*), semesters(*), profiles:instructor_id(*)');

    if (semesterId) {
      query = query.eq('semester_id', semesterId);
    }

    return from(query).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data || [];
      })
    );
  }

  getCourse(id: string): Observable<any> {
    return from(
      this.supabase.client
        .from('courses')
        .select('*, academies(*), semesters(*), profiles:instructor_id(*)')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data;
      })
    );
  }

  registerToCourse(courseId: string, semesterId: string): Observable<any> {
    return from(
      this.supabase.client
        .from('course_registrations')
        .insert({
          course_id: courseId,
          semester_id: semesterId,
          status: 'pending',
        })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data;
      })
    );
  }
}
```

---

## 🚀 Deployment en Cloudflare Pages

### 1. Preparar Build

Asegurarse de que `angular.json` tenga la configuración de producción:

```json
{
  "build": {
    "builder": "@angular-devkit/build-angular:application",
    "outputPath": "dist/iyf-backend-2026/browser",
    ...
  }
}
```

### 2. Configurar Variables de Entorno en Cloudflare

1. Ir a Cloudflare Pages
2. Seleccionar el proyecto
3. Settings > Environment Variables
4. Agregar:
   - `SUPABASE_URL`: Tu URL de Supabase
   - `SUPABASE_ANON_KEY`: Tu anon key

### 3. Build Command

```bash
npm run build
```

### 4. Output Directory

```
dist/iyf-backend-2026/browser
```

### 5. Configurar `_redirects` para SPA

Ya existe `src/_redirects`, asegurarse de que tenga:

```
/*    /index.html   200
```

---

## 📝 Notas Importantes

1. **Row Level Security (RLS)**: Es crucial para la seguridad. Todas las tablas deben tener RLS habilitado.

2. **Service Role Key**: NUNCA exponer en el frontend. Solo usar en Edge Functions o backend.

3. **Anon Key**: Es seguro exponer en el frontend porque RLS protege los datos.

4. **Edge Functions**: Para lógica compleja que no se puede hacer con RLS, usar Supabase Edge Functions (Deno).

5. **Realtime**: Puedes suscribirte a cambios en tiempo real:
```typescript
this.supabase.client
  .channel('course-registrations')
  .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'course_registrations' }, (payload) => {
    console.log('New registration!', payload);
  })
  .subscribe();
```

---

## 🔐 Seguridad

- ✅ RLS protege los datos a nivel de base de datos
- ✅ JWT tokens manejados automáticamente por Supabase
- ✅ Políticas de seguridad en cada tabla
- ✅ Validación de roles en las políticas

---

**Esta guía será actualizada conforme se configure Supabase.**

