-- ============================================
-- Create Temporary Admin User
-- ============================================
-- This script creates a temporary admin user for testing
-- 
-- IMPORTANT: Change the password after first login!
-- 
-- Email: admin@iyforlando.org
-- Password: TempAdmin2026!
-- ============================================

-- Create user in auth.users
-- Note: This requires service_role key or must be done via Supabase Dashboard
-- For security, we'll create a function that can be called with proper permissions

-- Function to create admin user (must be run with service_role)
CREATE OR REPLACE FUNCTION public.create_temp_admin_user()
RETURNS TEXT AS $$
DECLARE
  new_user_id UUID;
BEGIN
  -- Generate a UUID for the user
  new_user_id := gen_random_uuid();
  
  -- Insert into auth.users (this requires service_role permissions)
  -- Note: This is a template - actual user creation should be done via Supabase Dashboard
  -- or Supabase Management API with service_role key
  
  -- For now, we'll just create the profile entry
  -- The user should be created via Dashboard first, then this will create the profile
  
  RETURN 'User creation requires Supabase Dashboard or Management API. See instructions below.';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- ALTERNATIVE: Manual User Creation Instructions
-- ============================================
-- 
-- OPTION 1: Via Supabase Dashboard (RECOMMENDED)
-- 1. Go to Supabase Dashboard > Authentication > Users
-- 2. Click "Add User" > "Create new user"
-- 3. Enter:
--    - Email: admin@iyforlando.org
--    - Password: TempAdmin2026!
--    - Auto Confirm User: YES
-- 4. After user is created, run the SQL below to set as admin
--
-- OPTION 2: Via Supabase CLI (if installed)
-- supabase auth users create admin@iyforlando.org --password TempAdmin2026! --email-confirm
--
-- ============================================

-- After user is created via Dashboard, run this to set as admin:
-- (Replace 'USER_EMAIL_HERE' with the actual email or user ID)

-- Update profile to admin role (run this after user is created)
-- First, get the user ID from auth.users
DO $$
DECLARE
  admin_user_id UUID;
BEGIN
  -- Find user by email
  SELECT id INTO admin_user_id
  FROM auth.users
  WHERE email = 'admin@iyforlando.org'
  LIMIT 1;
  
  -- If user exists, update their profile to admin
  IF admin_user_id IS NOT NULL THEN
    -- Update or insert profile
    INSERT INTO public.profiles (id, email, role, status)
    VALUES (admin_user_id, 'admin@iyforlando.org', 'admin', 'active')
    ON CONFLICT (id) DO UPDATE
    SET role = 'admin', status = 'active', updated_at = NOW();
    
    RAISE NOTICE 'Admin user profile created/updated for user: %', admin_user_id;
  ELSE
    RAISE NOTICE 'User admin@iyforlando.org not found. Please create the user first via Dashboard.';
  END IF;
END $$;

-- ============================================
-- VERIFICATION
-- ============================================
-- Run this to verify the admin user was created:
SELECT 
  p.id,
  p.email,
  p.role,
  p.status,
  u.email as auth_email,
  u.email_confirmed_at
FROM public.profiles p
JOIN auth.users u ON u.id = p.id
WHERE p.email = 'admin@iyforlando.org' AND p.role = 'admin';

-- ============================================
-- END
-- ============================================

