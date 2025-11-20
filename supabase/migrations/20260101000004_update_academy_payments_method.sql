-- ============================================
-- Update academy_payments to allow 'discount' method
-- ============================================

-- Drop the existing check constraint
ALTER TABLE public.academy_payments
  DROP CONSTRAINT IF EXISTS academy_payments_method_check;

-- Add new check constraint that includes 'discount'
ALTER TABLE public.academy_payments
  ADD CONSTRAINT academy_payments_method_check 
  CHECK (method IN ('cash', 'zelle', 'discount'));

