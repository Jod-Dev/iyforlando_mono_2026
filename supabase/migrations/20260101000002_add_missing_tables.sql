-- ============================================
-- Add Missing Tables from Old Dashboard
-- ============================================
-- This migration adds tables needed for:
-- - Volunteer hours tracking (check-in/check-out)
-- - Volunteer codes (QR codes)
-- - Volunteer applications
-- - Volunteer schedules
-- - Invoices and payments
-- - Pricing configuration
-- ============================================

-- ============================================
-- 1. UPDATE EVENTS TABLE - Add missing fields
-- ============================================
-- Note: event_date already exists as TIMESTAMP WITH TIME ZONE
-- We'll add start_time and end_time as TIME fields
-- For date-only operations, we can extract the date part from event_date
ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS start_time TIME,
  ADD COLUMN IF NOT EXISTS end_time TIME,
  ADD COLUMN IF NOT EXISTS qr_code TEXT;

-- ============================================
-- 2. VOLUNTEER HOURS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS public.volunteer_hours (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  volunteer_id TEXT NOT NULL, -- volunteer code
  volunteer_name TEXT NOT NULL,
  volunteer_email TEXT NOT NULL,
  event_id UUID REFERENCES public.events(id) ON DELETE CASCADE,
  event_name TEXT NOT NULL,
  check_in_time TIMESTAMP WITH TIME ZONE,
  check_out_time TIMESTAMP WITH TIME ZONE,
  check_in_location JSONB, -- {latitude, longitude, accuracy, address}
  check_out_location JSONB, -- {latitude, longitude, accuracy, address}
  total_hours DECIMAL(5,2),
  status TEXT DEFAULT 'checked-in' CHECK (status IN ('checked-in', 'checked-out', 'completed')),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_hours ENABLE ROW LEVEL SECURITY;

-- Policy: Admins can view all volunteer hours
CREATE POLICY "Admins can view all volunteer hours"
  ON public.volunteer_hours FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can modify volunteer hours
CREATE POLICY "Admins can modify volunteer hours"
  ON public.volunteer_hours FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_volunteer_hours_updated_at BEFORE UPDATE ON public.volunteer_hours
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 3. VOLUNTEER CODES TABLE
-- ============================================
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

-- Policy: Admins can view all volunteer codes
CREATE POLICY "Admins can view all volunteer codes"
  ON public.volunteer_codes FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can modify volunteer codes
CREATE POLICY "Admins can modify volunteer codes"
  ON public.volunteer_codes FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_volunteer_codes_updated_at BEFORE UPDATE ON public.volunteer_codes
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 4. VOLUNTEER APPLICATIONS TABLE
-- ============================================
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
  availability JSONB, -- {days, times, commitment, flexible, maxHoursPerDay}
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

-- Policy: Admins can view all volunteer applications
CREATE POLICY "Admins can view all volunteer applications"
  ON public.volunteer_applications FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Anyone can create volunteer applications (public registration)
CREATE POLICY "Anyone can create volunteer applications"
  ON public.volunteer_applications FOR INSERT
  WITH CHECK (true);

-- Policy: Admins can modify volunteer applications
CREATE POLICY "Admins can modify volunteer applications"
  ON public.volunteer_applications FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_volunteer_applications_updated_at BEFORE UPDATE ON public.volunteer_applications
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 5. VOLUNTEER SCHEDULE TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS public.volunteer_schedule (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  volunteer_name TEXT NOT NULL,
  volunteer_email TEXT NOT NULL,
  volunteer_code TEXT NOT NULL,
  volunteer_phone TEXT,
  status TEXT DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'confirmed', 'completed', 'cancelled')),
  date DATE,
  selected_slots JSONB, -- Array of {id, date, startTime, endTime, hours} or strings
  total_hours DECIMAL(5,2),
  slot_id TEXT,
  reserved_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.volunteer_schedule ENABLE ROW LEVEL SECURITY;

-- Policy: Admins can view all volunteer schedules
CREATE POLICY "Admins can view all volunteer schedules"
  ON public.volunteer_schedule FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can modify volunteer schedules
CREATE POLICY "Admins can modify volunteer schedules"
  ON public.volunteer_schedule FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_volunteer_schedule_updated_at BEFORE UPDATE ON public.volunteer_schedule
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 6. ACADEMY INVOICES TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS public.academy_invoices (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  student_name TEXT NOT NULL,
  lines JSONB NOT NULL, -- Array of InvoiceLine
  subtotal DECIMAL(10,2) NOT NULL,
  lunch JSONB, -- {semesterSelected, singleQty, prices}
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

-- Policy: Students can view their own invoices
CREATE POLICY "Students can view own invoices"
  ON public.academy_invoices FOR SELECT
  USING (auth.uid() = student_id);

-- Policy: Admins can view all invoices
CREATE POLICY "Admins can view all invoices"
  ON public.academy_invoices FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can modify invoices
CREATE POLICY "Admins can modify invoices"
  ON public.academy_invoices FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_academy_invoices_updated_at BEFORE UPDATE ON public.academy_invoices
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 7. ACADEMY PAYMENTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS public.academy_payments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  invoice_id UUID REFERENCES public.academy_invoices(id) ON DELETE CASCADE,
  student_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  amount DECIMAL(10,2) NOT NULL,
  method TEXT NOT NULL CHECK (method IN ('cash', 'zelle')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_payments ENABLE ROW LEVEL SECURITY;

-- Policy: Students can view their own payments
CREATE POLICY "Students can view own payments"
  ON public.academy_payments FOR SELECT
  USING (auth.uid() = student_id);

-- Policy: Admins can view all payments
CREATE POLICY "Admins can view all payments"
  ON public.academy_payments FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can create payments
CREATE POLICY "Admins can create payments"
  ON public.academy_payments FOR INSERT
  WITH CHECK (public.is_admin(auth.uid()));

-- ============================================
-- 8. ACADEMY PRICING TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS public.academy_pricing (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  academy_prices JSONB, -- Record<string, number>
  items JSONB, -- Array of PricingItem
  currency TEXT DEFAULT 'USD',
  lunch JSONB, -- {semester, single}
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_pricing ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can view pricing (public information)
CREATE POLICY "Anyone can view pricing"
  ON public.academy_pricing FOR SELECT
  USING (true);

-- Policy: Only admins can modify pricing
CREATE POLICY "Only admins can modify pricing"
  ON public.academy_pricing FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_academy_pricing_updated_at BEFORE UPDATE ON public.academy_pricing
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- 9. ACADEMY REGISTRATIONS TABLE (for old dashboard compatibility)
-- ============================================
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
  first_period JSONB, -- {academy, level}
  second_period JSONB, -- {academy, level}
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.academy_registrations ENABLE ROW LEVEL SECURITY;

-- Policy: Anyone can create registrations (public registration)
CREATE POLICY "Anyone can create academy registrations"
  ON public.academy_registrations FOR INSERT
  WITH CHECK (true);

-- Policy: Admins can view all registrations
CREATE POLICY "Admins can view all academy registrations"
  ON public.academy_registrations FOR SELECT
  USING (public.is_admin(auth.uid()));

-- Policy: Admins can modify registrations
CREATE POLICY "Admins can modify academy registrations"
  ON public.academy_registrations FOR ALL
  USING (public.is_admin(auth.uid()));

-- Trigger for updated_at
CREATE TRIGGER update_academy_registrations_updated_at BEFORE UPDATE ON public.academy_registrations
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============================================
-- END OF MIGRATION
-- ============================================

