-- ============================================
-- CREAR USUARIO ADMIN - Script Completo
-- ============================================
-- Ejecuta este script en Supabase Dashboard > SQL Editor
-- ============================================

-- PASO 1: Verificar si el usuario ya existe
DO $$
DECLARE
  user_exists BOOLEAN;
  user_id UUID;
BEGIN
  -- Verificar si existe
  SELECT EXISTS(
    SELECT 1 FROM auth.users WHERE email = 'admin@iyforlando.org'
  ) INTO user_exists;
  
  IF user_exists THEN
    SELECT id INTO user_id FROM auth.users WHERE email = 'admin@iyforlando.org';
    RAISE NOTICE '✅ Usuario ya existe con ID: %', user_id;
  ELSE
    RAISE NOTICE '❌ Usuario NO existe. Debes crearlo via Dashboard primero.';
    RAISE NOTICE '';
    RAISE NOTICE '📝 INSTRUCCIONES:';
    RAISE NOTICE '1. Ve a Authentication > Users';
    RAISE NOTICE '2. Click "Add User" > "Create new user"';
    RAISE NOTICE '3. Email: admin@iyforlando.org';
    RAISE NOTICE '4. Password: TempAdmin2026!';
    RAISE NOTICE '5. ✅ Auto Confirm User: SÍ (MUY IMPORTANTE)';
    RAISE NOTICE '6. Click "Create User"';
    RAISE NOTICE '7. Luego ejecuta este script de nuevo';
    RETURN;
  END IF;
END $$;

-- PASO 2: Configurar perfil como admin
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
      email = 'admin@iyforlando.org',
      first_name = 'Admin',
      last_name = 'IYF Orlando',
      updated_at = NOW();
    
    RAISE NOTICE '✅ Perfil admin creado/actualizado para usuario: %', admin_user_id;
  ELSE
    RAISE NOTICE '⚠️  Usuario no encontrado. Crea el usuario primero via Dashboard.';
  END IF;
END $$;

-- PASO 3: Confirmar email si no está confirmado
UPDATE auth.users 
SET email_confirmed_at = COALESCE(email_confirmed_at, NOW())
WHERE email = 'admin@iyforlando.org'
AND email_confirmed_at IS NULL;

-- PASO 4: Verificación final
SELECT 
  'VERIFICACIÓN FINAL' as tipo,
  u.id,
  u.email,
  CASE 
    WHEN u.email_confirmed_at IS NOT NULL THEN '✅ Confirmado'
    ELSE '❌ NO confirmado'
  END as email_status,
  COALESCE(p.role, 'NO PERFIL') as role,
  COALESCE(p.status, 'NO PERFIL') as status,
  CASE 
    WHEN u.email_confirmed_at IS NOT NULL 
         AND p.role = 'admin' 
         AND p.status = 'active'
    THEN '✅ TODO CORRECTO - Puedes hacer login'
    ELSE '❌ FALTA CONFIGURAR'
  END as estado_final
FROM auth.users u
LEFT JOIN public.profiles p ON p.id = u.id
WHERE u.email = 'admin@iyforlando.org';

