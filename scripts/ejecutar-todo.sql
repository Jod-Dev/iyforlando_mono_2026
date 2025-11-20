-- ============================================
-- EJECUTAR TODO - Migraciones y Usuario Admin
-- ============================================
-- Este script ejecuta todas las migraciones pendientes
-- y crea el usuario temporal admin
-- 
-- INSTRUCCIONES:
-- 1. Copia TODO este contenido
-- 2. Ve a Supabase Dashboard > SQL Editor
-- 3. Pega y ejecuta
-- ============================================

-- ============================================
-- PARTE 1: Migración de Tablas Faltantes
-- ============================================

-- 1. UPDATE EVENTS TABLE - Add missing fields
ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS start_time TIME,
  ADD COLUMN IF NOT EXISTS end_time TIME,
  ADD COLUMN IF NOT EXISTS qr_code TEXT;

-- 2. VOLUNTEER HOURS TABLE
CREATE TABLE IF NOT EXISTS public.volunteer_hours (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  volunteer_id TEXT NOT NULL,
  volunteer_name TEXT NOT NULL,
  volunteer_email TEXT NOT NULL,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  event_name TEXT NOT NULL,
  check_in_time TIMESTAMP WITH TIME ZONE,
  check_out_time TIMESTAMP WITH TIME ZONE,
  check_in_location JSONB,
  check_out_location JSONB,
  total_hours DECIMAL(5,2),
  status TEXT DEFAULT 'checked-in' CHECK (status IN ('checked-in', 'checked-out', 'completed')),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_hours ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can view all volunteer hours"
  ON public.volunteer_hours FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify volunteer hours"
  ON public.volunteer_hours FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_volunteer_hours_updated_at BEFORE UPDATE ON public.volunteer_hours
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 3. VOLUNTEER CODES TABLE
CREATE TABLE IF NOT EXISTS public.volunteer_codes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  code TEXT NOT NULL UNIQUE,
  volunteer_name TEXT NOT NULL,
  volunteer_email TEXT NOT NULL,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_codes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can view all volunteer codes"
  ON public.volunteer_codes FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify volunteer codes"
  ON public.volunteer_codes FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_volunteer_codes_updated_at BEFORE UPDATE ON public.volunteer_codes
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 4. VOLUNTEER APPLICATIONS TABLE
CREATE TABLE IF NOT EXISTS public.volunteer_applications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  gender TEXT,
  tshirt_size TEXT,
  emergency_contact TEXT,
  emergency_phone TEXT,
  volunteer_code TEXT,
  source TEXT,
  event_info_accepted BOOLEAN DEFAULT FALSE,
  terms_accepted BOOLEAN DEFAULT FALSE,
  age INTEGER,
  phone TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  availability JSONB,
  interests TEXT[],
  skills TEXT[],
  languages TEXT[],
  background_check_completed BOOLEAN DEFAULT FALSE,
  training_completed BOOLEAN DEFAULT FALSE,
  orientation_attended BOOLEAN DEFAULT FALSE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'active', 'inactive')),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_applications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can view all volunteer applications"
  ON public.volunteer_applications FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Anyone can create volunteer applications"
  ON public.volunteer_applications FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Admins can modify volunteer applications"
  ON public.volunteer_applications FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_volunteer_applications_updated_at BEFORE UPDATE ON public.volunteer_applications
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 5. VOLUNTEER SCHEDULE TABLE
CREATE TABLE IF NOT EXISTS public.volunteer_schedule (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  volunteer_name TEXT NOT NULL,
  volunteer_email TEXT NOT NULL,
  volunteer_code TEXT NOT NULL,
  volunteer_phone TEXT,
  status TEXT DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'confirmed', 'completed', 'cancelled')),
  date DATE,
  selected_slots JSONB,
  total_hours DECIMAL(5,2),
  slot_id TEXT,
  reserved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_schedule ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can view all volunteer schedules"
  ON public.volunteer_schedule FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify volunteer schedules"
  ON public.volunteer_schedule FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_volunteer_schedule_updated_at BEFORE UPDATE ON public.volunteer_schedule
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 6. ACADEMY INVOICES TABLE
CREATE TABLE IF NOT EXISTS public.academy_invoices (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  student_name TEXT NOT NULL,
  lines JSONB NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  lunch JSONB,
  lunch_amount DECIMAL(10,2) DEFAULT 0,
  discount_amount DECIMAL(10,2) DEFAULT 0,
  discount_note TEXT,
  total DECIMAL(10,2) NOT NULL,
  paid DECIMAL(10,2) DEFAULT 0,
  balance DECIMAL(10,2) NOT NULL,
  status TEXT DEFAULT 'unpaid' CHECK (status IN ('unpaid', 'partial', 'paid', 'exonerated')),
  method TEXT CHECK (method IN ('cash', 'zelle')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_invoices ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Students can view own invoices"
  ON public.academy_invoices FOR SELECT
  USING (auth.uid() = student_id);

CREATE POLICY "Admins can view all invoices"
  ON public.academy_invoices FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify invoices"
  ON public.academy_invoices FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_academy_invoices_updated_at BEFORE UPDATE ON public.academy_invoices
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 7. ACADEMY PAYMENTS TABLE
CREATE TABLE IF NOT EXISTS public.academy_payments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  invoice_id UUID REFERENCES public.academy_invoices(id) ON DELETE CASCADE,
  student_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  amount DECIMAL(10,2) NOT NULL,
  method TEXT NOT NULL CHECK (method IN ('cash', 'zelle')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_payments ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Students can view own payments"
  ON public.academy_payments FOR SELECT
  USING (auth.uid() = student_id);

CREATE POLICY "Admins can view all payments"
  ON public.academy_payments FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can create payments"
  ON public.academy_payments FOR INSERT
  WITH CHECK (public.is_admin(auth.uid()));

-- 8. ACADEMY PRICING TABLE
CREATE TABLE IF NOT EXISTS public.academy_pricing (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  academy_prices JSONB,
  items JSONB,
  currency TEXT DEFAULT 'USD',
  lunch JSONB,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_pricing ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view pricing"
  ON public.academy_pricing FOR SELECT
  USING (true);

CREATE POLICY "Only admins can modify pricing"
  ON public.academy_pricing FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_academy_pricing_updated_at BEFORE UPDATE ON public.academy_pricing
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 9. ACADEMY REGISTRATIONS TABLE
CREATE TABLE IF NOT EXISTS public.academy_registrations (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  cell_number TEXT,
  email TEXT,
  city TEXT,
  state TEXT,
  birthday DATE,
  gender TEXT,
  confirm_email TEXT,
  address TEXT,
  zip_code TEXT,
  age INTEGER,
  first_period JSONB,
  second_period JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_registrations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can create academy registrations"
  ON public.academy_registrations FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Admins can view all academy registrations"
  ON public.academy_registrations FOR SELECT
  USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can modify academy registrations"
  ON public.academy_registrations FOR ALL
  USING (public.is_admin(auth.uid()));

CREATE TRIGGER update_academy_registrations_updated_at BEFORE UPDATE ON public.academy_registrations
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- PARTE 2: Crear Usuario Admin Temporal
-- ============================================
-- NOTA: Primero debes crear el usuario via Dashboard
-- Luego ejecuta este bloque para configurarlo como admin
-- ============================================

-- Actualizar perfil a admin (ejecutar DESPUÉS de crear usuario via Dashboard)
DO $$
DECLARE
  admin_user_id UUID;
BEGIN
  -- Buscar usuario por email
  SELECT id INTO admin_user_id
  FROM auth.users
  WHERE email = 'admin@iyforlando.org'
  LIMIT 1;
  
  -- Si el usuario existe, actualizar su perfil a admin
  IF admin_user_id IS NOT NULL THEN
    -- Insertar o actualizar perfil
    INSERT INTO public.profiles (id, email, first_name, last_name, role, status)
    VALUES (admin_user_id, 'admin@iyforlando.org', 'Admin', 'IYF Orlando', 'admin', 'active')
    ON CONFLICT (id) DO UPDATE
    SET role = 'admin', status = 'active', updated_at = NOW();
    
    RAISE NOTICE '✅ Admin user profile created/updated for user: %', admin_user_id;
  ELSE
    RAISE NOTICE '⚠️  User admin@iyforlando.org not found.';
    RAISE NOTICE '📝 Please create the user first via Dashboard:';
    RAISE NOTICE '   1. Go to Authentication > Users';
    RAISE NOTICE '   2. Click "Add User" > "Create new user"';
    RAISE NOTICE '   3. Email: admin@iyforlando.org';
    RAISE NOTICE '   4. Password: TempAdmin2026!';
    RAISE NOTICE '   5. Auto Confirm User: YES';
    RAISE NOTICE '   6. Then run this script again';
  END IF;
END $$;

-- ============================================
-- VERIFICACIÓN
-- ============================================

-- Verificar tablas creadas
SELECT 
  'Tables created' as status,
  COUNT(*) as count
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN (
  'volunteer_hours',
  'volunteer_codes',
  'volunteer_applications',
  'volunteer_schedule',
  'academy_invoices',
  'academy_payments',
  'academy_pricing',
  'academy_registrations'
);

-- Verificar usuario admin
SELECT 
  'Admin user' as status,
  p.id,
  p.email,
  p.role,
  p.status,
  u.email_confirmed_at IS NOT NULL as email_confirmed
FROM public.profiles p
JOIN auth.users u ON u.id = p.id
WHERE p.email = 'admin@iyforlando.org' AND p.role = 'admin';

-- ============================================
-- ✅ FIN
-- ============================================
-- Si todo salió bien, deberías ver:
-- - 8 tablas creadas
-- - 1 usuario admin verificado
-- ============================================

