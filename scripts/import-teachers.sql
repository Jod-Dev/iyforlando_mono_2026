-- ============================================
-- Import Real Teachers Data
-- ============================================
-- This script inserts the real teachers from IYF Orlando
-- IMPORTANT: Make sure you've run the migration first:
-- supabase/migrations/20260101000005_create_teachers_table.sql
-- ============================================

-- Verify table exists (will throw error if it doesn't)
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'teachers') THEN
        RAISE EXCEPTION 'Table public.teachers does not exist. Please run the migration first: supabase/migrations/20260101000005_create_teachers_table.sql';
    END IF;
END $$;

-- Insert teachers
-- Note: academy_id will be set based on matching academy titles
-- If academy doesn't exist, we'll set academy_name only

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

-- Update academy_id for teachers where we can match by academy name
-- This will link teachers to their academies if the academy exists
UPDATE public.teachers t
SET academy_id = a.id
FROM public.academies a
WHERE t.academy_name = a.title
  AND t.academy_id IS NULL;

-- ============================================
-- END OF SCRIPT
-- ============================================

