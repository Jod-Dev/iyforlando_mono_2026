-- ============================================
-- IYF Orlando Platform 2026 - Initial Schema
-- ============================================
-- Este script crea todas las tablas y políticas RLS necesarias
-- Ejecutar en Supabase Dashboard > SQL Editor
-- ============================================

-- ============================================
-- 1. TABLA DE PERFILES (extiende auth.users)
-- ============================================
CREATE TABLE IF NOT EXISTS public.profiles (
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

-- Política: Admins pueden modificar todos los perfiles
CREATE POLICY "Admins can modify all profiles"
  ON public.profiles FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 2. TABLA DE SEMESTRES
-- ============================================
CREATE TABLE IF NOT EXISTS public.semesters (
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

-- Política: Todos pueden ver semestres activos y próximos
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

-- ============================================
-- 3. TABLA DE ACADEMIAS
-- ============================================
CREATE TABLE IF NOT EXISTS public.academies (
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

-- ============================================
-- 4. TABLA DE CURSOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.courses (
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

-- ============================================
-- 5. TABLA DE REGISTROS DE CURSOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.course_registrations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  course_id UUID REFERENCES public.courses(id) ON DELETE CASCADE,
  student_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'waitlist', 'cancelled')),
  registration_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  approved_at TIMESTAMP WITH TIME ZONE,
  approved_by UUID REFERENCES public.profiles(id),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(course_id, student_id)
);

ALTER TABLE public.course_registrations ENABLE ROW LEVEL SECURITY;

-- Política: Estudiantes pueden ver sus propios registros
CREATE POLICY "Students can view own registrations"
  ON public.course_registrations FOR SELECT
  USING (auth.uid() = student_id);

-- Política: Estudiantes pueden crear registros
CREATE POLICY "Students can create registrations"
  ON public.course_registrations FOR INSERT
  WITH CHECK (auth.uid() = student_id);

-- Política: Admins pueden ver todos los registros
CREATE POLICY "Admins can view all registrations"
  ON public.course_registrations FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Política: Admins pueden modificar registros
CREATE POLICY "Admins can modify registrations"
  ON public.course_registrations FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 6. TABLA DE EVENTOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.events (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  event_date TIMESTAMP WITH TIME ZONE NOT NULL,
  location TEXT,
  max_capacity INTEGER,
  current_registrations INTEGER DEFAULT 0,
  requires_volunteers BOOLEAN DEFAULT FALSE,
  volunteer_spots INTEGER DEFAULT 0,
  status TEXT DEFAULT 'upcoming' CHECK (status IN ('upcoming', 'active', 'completed', 'cancelled')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

-- Política: Todos pueden ver eventos próximos y activos
CREATE POLICY "Anyone can view upcoming events"
  ON public.events FOR SELECT
  USING (status = 'upcoming' OR status = 'active');

-- Política: Solo admins pueden modificar
CREATE POLICY "Only admins can modify events"
  ON public.events FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 7. TABLA DE REGISTROS DE EVENTOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.event_registrations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  participant_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'registered' CHECK (status IN ('registered', 'cancelled', 'attended', 'no_show')),
  registration_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(event_id, participant_id)
);

ALTER TABLE public.event_registrations ENABLE ROW LEVEL SECURITY;

-- Política: Usuarios pueden ver sus propios registros
CREATE POLICY "Users can view own event registrations"
  ON public.event_registrations FOR SELECT
  USING (auth.uid() = participant_id);

-- Política: Usuarios pueden crear registros
CREATE POLICY "Users can create event registrations"
  ON public.event_registrations FOR INSERT
  WITH CHECK (auth.uid() = participant_id);

-- Política: Usuarios pueden cancelar sus registros
CREATE POLICY "Users can cancel own registrations"
  ON public.event_registrations FOR UPDATE
  USING (auth.uid() = participant_id)
  WITH CHECK (auth.uid() = participant_id);

-- Política: Admins pueden ver todos los registros
CREATE POLICY "Admins can view all event registrations"
  ON public.event_registrations FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Política: Admins pueden modificar registros
CREATE POLICY "Admins can modify event registrations"
  ON public.event_registrations FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 8. TABLA DE VOLUNTARIOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.volunteers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  profile_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  skills TEXT[],
  availability JSONB, -- {days: ["Saturday", "Sunday"], times: "flexible"}
  total_hours INTEGER DEFAULT 0,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteers ENABLE ROW LEVEL SECURITY;

-- Política: Voluntarios pueden ver su propio perfil
CREATE POLICY "Volunteers can view own profile"
  ON public.volunteers FOR SELECT
  USING (auth.uid() = profile_id);

-- Política: Usuarios pueden registrarse como voluntarios
CREATE POLICY "Users can register as volunteers"
  ON public.volunteers FOR INSERT
  WITH CHECK (auth.uid() = profile_id);

-- Política: Voluntarios pueden actualizar su perfil
CREATE POLICY "Volunteers can update own profile"
  ON public.volunteers FOR UPDATE
  USING (auth.uid() = profile_id)
  WITH CHECK (auth.uid() = profile_id);

-- Política: Admins pueden ver todos los voluntarios
CREATE POLICY "Admins can view all volunteers"
  ON public.volunteers FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Política: Admins pueden modificar voluntarios
CREATE POLICY "Admins can modify volunteers"
  ON public.volunteers FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 9. TABLA DE ASIGNACIONES DE VOLUNTARIOS A EVENTOS
-- ============================================
CREATE TABLE IF NOT EXISTS public.volunteer_assignments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  volunteer_id UUID REFERENCES public.volunteers(id) ON DELETE CASCADE,
  role TEXT, -- "Setup", "Registration", "Cleanup", etc.
  hours_worked DECIMAL(5,2),
  status TEXT DEFAULT 'assigned' CHECK (status IN ('assigned', 'confirmed', 'completed', 'cancelled')),
  assigned_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  completed_at TIMESTAMP WITH TIME ZONE,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(event_id, volunteer_id)
);

ALTER TABLE public.volunteer_assignments ENABLE ROW LEVEL SECURITY;

-- Política: Voluntarios pueden ver sus asignaciones
CREATE POLICY "Volunteers can view own assignments"
  ON public.volunteer_assignments FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.volunteers
      WHERE id = volunteer_assignments.volunteer_id AND profile_id = auth.uid()
    )
  );

-- Política: Admins pueden ver todas las asignaciones
CREATE POLICY "Admins can view all assignments"
  ON public.volunteer_assignments FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Política: Solo admins pueden modificar asignaciones
CREATE POLICY "Only admins can modify assignments"
  ON public.volunteer_assignments FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- ============================================
-- 10. FUNCIÓN: Crear perfil automáticamente al registrarse
-- ============================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, first_name, last_name)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'first_name', ''),
    COALESCE(NEW.raw_user_meta_data->>'last_name', '')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger: Crear perfil cuando se crea un usuario
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- 11. FUNCIÓN: Actualizar updated_at automáticamente
-- ============================================
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Aplicar trigger a todas las tablas
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_semesters_updated_at BEFORE UPDATE ON public.semesters
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_academies_updated_at BEFORE UPDATE ON public.academies
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_courses_updated_at BEFORE UPDATE ON public.courses
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_course_registrations_updated_at BEFORE UPDATE ON public.course_registrations
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_events_updated_at BEFORE UPDATE ON public.events
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_event_registrations_updated_at BEFORE UPDATE ON public.event_registrations
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_volunteers_updated_at BEFORE UPDATE ON public.volunteers
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TRIGGER update_volunteer_assignments_updated_at BEFORE UPDATE ON public.volunteer_assignments
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- FIN DEL SCRIPT
-- ============================================
-- ✅ Todas las tablas, políticas RLS y triggers creados
-- 📝 Próximo paso: Probar la conexión desde Angular
-- ============================================

