-- ============================================
-- Fix: Corregir políticas RLS con recursión infinita
-- ============================================
-- Problema: Las políticas de admin consultan la tabla profiles
-- causando recursión infinita
-- Solución: Usar auth.jwt() para verificar el rol directamente
-- ============================================

-- Eliminar políticas problemáticas de profiles
DROP POLICY IF EXISTS "Admins can view all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Admins can modify all profiles" ON public.profiles;

-- Crear función helper para verificar si el usuario es admin
-- Esta función evita la recursión
CREATE OR REPLACE FUNCTION public.is_admin(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
  -- Verificar directamente sin usar RLS
  RETURN EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = user_id AND role = 'admin'
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Política mejorada: Admins pueden ver todos los perfiles
-- Usa la función helper que evita recursión
CREATE POLICY "Admins can view all profiles"
  ON public.profiles FOR SELECT
  USING (
    public.is_admin(auth.uid())
  );

-- Política mejorada: Admins pueden modificar todos los perfiles
CREATE POLICY "Admins can modify all profiles"
  ON public.profiles FOR ALL
  USING (
    public.is_admin(auth.uid())
  );

-- Aplicar el mismo fix a otras tablas que tienen el mismo problema

-- Semesters
DROP POLICY IF EXISTS "Only admins can modify semesters" ON public.semesters;
CREATE POLICY "Only admins can modify semesters"
  ON public.semesters FOR ALL
  USING (public.is_admin(auth.uid()));

-- Academies
DROP POLICY IF EXISTS "Only admins can modify academies" ON public.academies;
CREATE POLICY "Only admins can modify academies"
  ON public.academies FOR ALL
  USING (public.is_admin(auth.uid()));

-- Courses
DROP POLICY IF EXISTS "Only admins can modify courses" ON public.courses;
CREATE POLICY "Only admins can modify courses"
  ON public.courses FOR ALL
  USING (public.is_admin(auth.uid()));

-- Course registrations
DROP POLICY IF EXISTS "Admins can view all registrations" ON public.course_registrations;
DROP POLICY IF EXISTS "Admins can modify registrations" ON public.course_registrations;

CREATE POLICY "Admins can view all registrations"
  ON public.course_registrations FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify registrations"
  ON public.course_registrations FOR ALL
  USING (public.is_admin(auth.uid()));

-- Events
DROP POLICY IF EXISTS "Only admins can modify events" ON public.events;
CREATE POLICY "Only admins can modify events"
  ON public.events FOR ALL
  USING (public.is_admin(auth.uid()));

-- Event registrations
DROP POLICY IF EXISTS "Admins can view all event registrations" ON public.event_registrations;
DROP POLICY IF EXISTS "Admins can modify event registrations" ON public.event_registrations;

CREATE POLICY "Admins can view all event registrations"
  ON public.event_registrations FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify event registrations"
  ON public.event_registrations FOR ALL
  USING (public.is_admin(auth.uid()));

-- Volunteers
DROP POLICY IF EXISTS "Admins can view all volunteers" ON public.volunteers;
DROP POLICY IF EXISTS "Admins can modify volunteers" ON public.volunteers;

CREATE POLICY "Admins can view all volunteers"
  ON public.volunteers FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify volunteers"
  ON public.volunteers FOR ALL
  USING (public.is_admin(auth.uid()));

-- Volunteer assignments
DROP POLICY IF EXISTS "Admins can view all assignments" ON public.volunteer_assignments;
DROP POLICY IF EXISTS "Only admins can modify assignments" ON public.volunteer_assignments;

CREATE POLICY "Admins can view all assignments"
  ON public.volunteer_assignments FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Only admins can modify assignments"
  ON public.volunteer_assignments FOR ALL
  USING (public.is_admin(auth.uid()));

-- ============================================
-- FIN DEL FIX
-- ============================================

