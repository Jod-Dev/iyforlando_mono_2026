-- ============================================
-- Complete Teachers Setup Script
-- ============================================
-- This script creates the teachers table (if it doesn't exist)
-- and inserts all real teachers from IYF Orlando
-- ============================================

-- Step 1: Create the teachers table if it doesn't exist
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

-- Step 2: Create indexes if they don't exist
CREATE INDEX IF NOT EXISTS idx_teachers_status ON public.teachers(status);
CREATE INDEX IF NOT EXISTS idx_teachers_academy_id ON public.teachers(academy_id);
CREATE INDEX IF NOT EXISTS idx_teachers_profile_id ON public.teachers(profile_id);

-- Step 3: Enable RLS
ALTER TABLE public.teachers ENABLE ROW LEVEL SECURITY;

-- Step 4: Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Anyone can view active teachers" ON public.teachers;
DROP POLICY IF EXISTS "Admins can view all teachers" ON public.teachers;
DROP POLICY IF EXISTS "Admins can insert teachers" ON public.teachers;
DROP POLICY IF EXISTS "Admins can update teachers" ON public.teachers;
DROP POLICY IF EXISTS "Admins can delete teachers" ON public.teachers;

-- Step 5: Create RLS policies
CREATE POLICY "Anyone can view active teachers"
  ON public.teachers FOR SELECT
  USING (status = 'active');

CREATE POLICY "Admins can view all teachers"
  ON public.teachers FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can insert teachers"
  ON public.teachers FOR INSERT
  WITH CHECK (public.is_admin(auth.uid()));

CREATE POLICY "Admins can update teachers"
  ON public.teachers FOR UPDATE
  USING (public.is_admin(auth.uid()))
  WITH CHECK (public.is_admin(auth.uid()));

CREATE POLICY "Admins can delete teachers"
  ON public.teachers FOR DELETE
  USING (public.is_admin(auth.uid()));

-- Step 6: Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_teachers_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 7: Create trigger (drop first if exists)
DROP TRIGGER IF EXISTS update_teachers_updated_at ON public.teachers;
CREATE TRIGGER update_teachers_updated_at
  BEFORE UPDATE ON public.teachers
  FOR EACH ROW
  EXECUTE FUNCTION update_teachers_updated_at();

-- Step 8: Insert teachers data
-- Clear existing teachers (optional - comment out if you want to keep existing data)
-- DELETE FROM public.teachers;

INSERT INTO public.teachers (first_name, last_name, email, phone, academy_name, bio, status) VALUES
-- Art - Aung w pyo
('Aung', 'w pyo', 'apyo5757@gmail.com', '3864536528', 'Art', NULL, 'active'),

-- DIY - Jenny Lee
('Jenny', 'Lee', 'eunmilstory@gmail.com', '4074263362', 'DIY', NULL, 'active'),

-- Kids - Michelle Morales Pradis
('Michelle', 'Morales Pradis', 'michellemoralespradis@gmail.com', '3368073918', 'Kids', NULL, 'active'),

-- Korean Cooking - Eunji Lee
('Eunji', 'Lee', 'eunjistory87@gmail.com', '407-615-9813', 'Korean Cooking', 'Experience working in Korean Restaurant many years.', 'active'),

-- Korean Language - Alphabet - Hannah Lim
('Hannah', 'Lim', 'hyang1970@gmail.com', '4076256701', 'Korean Language - Alphabet', 'Native Korean speaker with many years of experience teaching Korean language', 'active'),

-- Korean Language - Beginner - Hannah Lim
('Hannah', 'Lim', 'hyang1070@gmail.com', '4076256701', 'Korean Language - Beginner', 'Native Korean speaker with many years of experience teaching Korean language', 'active'),

-- Korean Language - Intermediate - Tevin Im
('Tevin', 'Im', 'imtevin@gmail.com', '4078102341', 'Korean Language - Intermediate', NULL, 'active'),

-- Korean Language - K-Movie Conversation - Eunju Lee
('Eunju', 'Lee', 'eunjoolee0110@gmail.com', '4078677817', 'Korean Language - K-Movie Conversation', NULL, 'active'),

-- Piano - Hannah Choi
('Hannah', 'Choi', 'hannah@iyfusa.org', '407-312-1656', 'Piano', NULL, 'active'),

-- Pickleball - Jennie Godfrey
('Jennie', 'Godfrey', 'jggolf@proton.me', '352.406.9814', 'Pickleball', NULL, 'active'),

-- Soccer - Jod Louis
('Jod', 'Louis', 'ing.jod@gmail.com', '6562007031', 'Soccer', NULL, 'active'),

-- Stretch and Strengthen - Susan Sprott
('Susan', 'Sprott', 'sprottsusane@gmail.com', '8135635820', 'Stretch and Strengthen', NULL, 'active')
ON CONFLICT DO NOTHING;

-- Step 9: Update academy_id for teachers where we can match by academy name
-- This will link teachers to their academies if the academy exists
UPDATE public.teachers t
SET academy_id = a.id
FROM public.academies a
WHERE t.academy_name = a.title
  AND t.academy_id IS NULL;

-- ============================================
-- END OF SCRIPT
-- ============================================

