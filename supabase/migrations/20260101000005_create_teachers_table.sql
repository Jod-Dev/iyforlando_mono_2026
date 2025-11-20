-- ============================================
-- Create Teachers Table
-- ============================================
-- This migration creates the teachers table for managing academy teachers
-- ============================================

CREATE TABLE IF NOT EXISTS public.teachers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  profile_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  avatar TEXT,
  academy_id UUID REFERENCES public.academies(id) ON DELETE SET NULL,
  academy_name TEXT, -- Denormalized for quick access
  bio TEXT,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_teachers_status ON public.teachers(status);
CREATE INDEX IF NOT EXISTS idx_teachers_academy_id ON public.teachers(academy_id);
CREATE INDEX IF NOT EXISTS idx_teachers_profile_id ON public.teachers(profile_id);

-- Enable RLS
ALTER TABLE public.teachers ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can view active teachers
CREATE POLICY "Anyone can view active teachers"
  ON public.teachers FOR SELECT
  USING (status = 'active');

-- Policy: Admins can view all teachers
CREATE POLICY "Admins can view all teachers"
  ON public.teachers FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can insert teachers
CREATE POLICY "Admins can insert teachers"
  ON public.teachers FOR INSERT
  WITH CHECK (public.is_admin(auth.uid()));

-- Policy: Admins can update teachers
CREATE POLICY "Admins can update teachers"
  ON public.teachers FOR UPDATE
  USING (public.is_admin(auth.uid()))
  WITH CHECK (public.is_admin(auth.uid()));

-- Policy: Admins can delete teachers
CREATE POLICY "Admins can delete teachers"
  ON public.teachers FOR DELETE
  USING (public.is_admin(auth.uid()));

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_teachers_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_teachers_updated_at
  BEFORE UPDATE ON public.teachers
  FOR EACH ROW
  EXECUTE FUNCTION update_teachers_updated_at();

-- ============================================
-- END OF MIGRATION
-- ============================================

