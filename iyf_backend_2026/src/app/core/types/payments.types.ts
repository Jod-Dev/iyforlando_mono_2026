/**
 * Payment Types
 * Mapped from old dashboard Firebase/Firestore structure
 */

export interface PricingDoc {
  academyPrices: Record<string, number>;
  items?: PricingItem[];
  currency?: string;
  lunch?: {
    semester?: number | null;
    single?: number | null;
  };
  updatedAt?: string; // ISO timestamp
}

export interface PricingItem {
  id: string;
  academy: string;
  level?: string | null;
  p1?: number | null; // Period 1 price
  p2?: number | null; // Period 2 price
  enabled?: boolean;
  notes?: string;
}

export interface LunchPricing {
  semester?: number;
  single?: number;
}

export interface InvoiceLine {
  academy: string;
  period: 1 | 2;
  level?: string | null;
  unitPrice: number;
  qty: number;
  amount: number;
  instructor?: {
    name: string;
    email?: string;
    phone?: string;
    credentials?: string;
  };
  instructionDates?: {
    startDate: string; // ISO date string
    endDate: string; // ISO date string
    totalHours: number;
    schedule?: string; // e.g., "Saturdays 10:00 AM - 12:00 PM"
  };
  serviceRate?: number; // Rate per hour for elective courses
}

export interface Invoice {
  id: string;
  studentId: string;
  studentName: string;
  lines: InvoiceLine[];
  subtotal: number;
  lunch?: {
    semesterSelected?: boolean;
    singleQty?: number;
    prices?: {
      semester?: number;
      single?: number;
    };
  };
  lunchAmount?: number;
  discountAmount?: number;
  discountNote?: string | null;
  total: number;
  paid: number;
  balance: number;
  status: InvoiceStatus;
  method?: PaymentMethod | null;
  createdAt: string; // ISO timestamp
  updatedAt?: string; // ISO timestamp
}

export type InvoiceStatus = 'unpaid' | 'partial' | 'paid' | 'exonerated';
export type PaymentMethod = 'cash' | 'zelle';

export interface Payment {
  id: string;
  invoiceId: string;
  studentId: string;
  amount: number;
  method: PaymentMethod;
  createdAt: string; // ISO timestamp
}

