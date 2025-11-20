-- ============================================
-- Update Academies Table with Full JSON Fields
-- ============================================
-- This migration adds all fields from the academies JSON structure
-- ============================================

-- Add new columns to academies table
ALTER TABLE public.academies
  ADD COLUMN IF NOT EXISTS title TEXT,
  ADD COLUMN IF NOT EXISTS price TEXT,
  ADD COLUMN IF NOT EXISTS level TEXT,
  ADD COLUMN IF NOT EXISTS age TEXT,
  ADD COLUMN IF NOT EXISTS schedule JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS image TEXT,
  ADD COLUMN IF NOT EXISTS tag TEXT,
  ADD COLUMN IF NOT EXISTS catch_phrase TEXT,
  ADD COLUMN IF NOT EXISTS goal JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS equipment TEXT,
  ADD COLUMN IF NOT EXISTS academy_details_img TEXT,
  ADD COLUMN IF NOT EXISTS link_name TEXT UNIQUE,
  ADD COLUMN IF NOT EXISTS note JSONB DEFAULT '[]'::jsonb;

-- Update name to title if name exists but title doesn't
UPDATE public.academies
SET title = name
WHERE title IS NULL AND name IS NOT NULL;

-- Update RLS policies to allow admins to view all academies (not just active)
DROP POLICY IF EXISTS "Anyone can view active academies" ON public.academies;
CREATE POLICY "Anyone can view active academies"
  ON public.academies FOR SELECT
  USING (status = 'active');

-- Policy: Admins can view all academies (including inactive)
DROP POLICY IF EXISTS "Admins can view all academies" ON public.academies;
CREATE POLICY "Admins can view all academies"
  ON public.academies FOR SELECT
  USING (public.is_admin(auth.uid()));

-- ============================================
-- END OF MIGRATION
-- ============================================

