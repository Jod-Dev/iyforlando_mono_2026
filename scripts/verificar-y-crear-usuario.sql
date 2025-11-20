-- ============================================
-- Script para Verificar y Crear Usuario Admin
-- ============================================
-- Ejecuta este script en Supabase Dashboard > SQL Editor
-- ============================================

-- PASO 1: Verificar si el usuario existe
SELECT 
  'Verificando usuario...' as paso,
  CASE 
    WHEN EXISTS (SELECT 1 FROM auth.users WHERE email = 'admin@iyforlando.org') 
    THEN '✅ Usuario EXISTE' 
    ELSE '❌ Usuario NO EXISTE - Necesitas crearlo via Dashboard' 
  END as resultado;

-- PASO 2: Verificar perfil
SELECT 
  'Verificando perfil...' as paso,
  CASE 
    WHEN EXISTS (
      SELECT 1 FROM public.profiles p
      JOIN auth.users u ON u.id = p.id
      WHERE p.email = 'admin@iyforlando.org'
    )
    THEN '✅ Perfil EXISTE' 
    ELSE '❌ Perfil NO EXISTE' 
  END as resultado;

-- PASO 3: Verificar si es admin
SELECT 
  'Verificando rol admin...' as paso,
  CASE 
    WHEN EXISTS (
      SELECT 1 FROM public.profiles 
      WHERE email = 'admin@iyforlando.org' AND role = 'admin'
    )
    THEN '✅ Es ADMIN' 
    ELSE '❌ NO es admin' 
  END as resultado;

-- PASO 4: Verificar email confirmado
SELECT 
  'Verificando email confirmado...' as paso,
  CASE 
    WHEN EXISTS (
      SELECT 1 FROM auth.users 
      WHERE email = 'admin@iyforlando.org' AND email_confirmed_at IS NOT NULL
    )
    THEN '✅ Email CONFIRMADO' 
    ELSE '❌ Email NO confirmado' 
  END as resultado;

-- ============================================
-- Si el usuario NO existe, créalo via Dashboard:
-- ============================================
-- 1. Ve a Authentication > Users
-- 2. Click "Add User" > "Create new user"
-- 3. Email: admin@iyforlando.org
-- 4. Password: TempAdmin2026!
-- 5. ✅ Auto Confirm User: SÍ
-- 6. Click "Create User"
-- ============================================

-- PASO 5: Configurar perfil como admin (ejecutar DESPUÉS de crear usuario)
DO $$
DECLARE
  admin_user_id UUID;
BEGIN
  -- Buscar usuario
  SELECT id INTO admin_user_id
  FROM auth.users
  WHERE email = 'admin@iyforlando.org'
  LIMIT 1;
  
  IF admin_user_id IS NOT NULL THEN
    -- Crear o actualizar perfil
    INSERT INTO public.profiles (id, email, first_name, last_name, role, status)
    VALUES (admin_user_id, 'admin@iyforlando.org', 'Admin', 'IYF Orlando', 'admin', 'active')
    ON CONFLICT (id) DO UPDATE
    SET 
      role = 'admin', 
      status = 'active', 
      updated_at = NOW();
    
    RAISE NOTICE '✅ Perfil admin creado/actualizado para usuario: %', admin_user_id;
  ELSE
    RAISE NOTICE '⚠️  Usuario admin@iyforlando.org no encontrado.';
    RAISE NOTICE '📝 Por favor crea el usuario primero via Dashboard.';
  END IF;
END $$;

-- PASO 6: Confirmar email si no está confirmado
UPDATE auth.users 
SET email_confirmed_at = COALESCE(email_confirmed_at, NOW())
WHERE email = 'admin@iyforlando.org'
AND email_confirmed_at IS NULL;

-- PASO 7: Verificación final
SELECT 
  'VERIFICACIÓN FINAL' as tipo,
  u.id,
  u.email,
  u.email_confirmed_at IS NOT NULL as email_confirmado,
  p.role,
  p.status,
  CASE 
    WHEN u.email_confirmed_at IS NOT NULL AND p.role = 'admin' AND p.status = 'active'
    THEN '✅ TODO CORRECTO - Puedes hacer login'
    ELSE '❌ FALTA CONFIGURAR - Revisa los pasos anteriores'
  END as estado
FROM auth.users u
LEFT JOIN public.profiles p ON p.id = u.id
WHERE u.email = 'admin@iyforlando.org';

