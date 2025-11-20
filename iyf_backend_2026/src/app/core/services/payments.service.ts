import { Injectable, inject } from '@angular/core';
import { SupabaseService } from '../supabase/supabase.service';
import { Observable, from, map, catchError, throwError } from 'rxjs';
import { Invoice, Payment, InvoiceStatus, PaymentMethod, PricingDoc } from '../types';

/**
 * Payments Service
 * Migrated from old dashboard useInvoices and usePayments hooks
 * Handles invoices, payments, and pricing
 */
@Injectable({
  providedIn: 'root'
})
export class PaymentsService {
  private supabase = inject(SupabaseService);

  /**
   * Get all invoices, ordered by creation date descending
   */
  getInvoices(): Observable<Invoice[]> {
    return from(
      this.supabase.client
        .from('academy_invoices')
        .select('*')
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapInvoiceFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching invoices:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get invoices for a specific student
   */
  getInvoicesByStudent(studentId: string): Observable<Invoice[]> {
    return from(
      this.supabase.client
        .from('academy_invoices')
        .select('*')
        .eq('student_id', studentId)
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapInvoiceFromDb);
      })
    );
  }

  /**
   * Get a single invoice by ID
   */
  getInvoiceById(id: string): Observable<Invoice | null> {
    return from(
      this.supabase.client
        .from('academy_invoices')
        .select('*')
        .eq('id', id)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) {
          if (error.code === 'PGRST116') return null;
          throw error;
        }
        return data ? this.mapInvoiceFromDb(data) : null;
      })
    );
  }

  /**
   * Create a new invoice
   */
  createInvoice(invoiceData: Omit<Invoice, 'id' | 'createdAt' | 'updatedAt'>): Observable<string> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('academy_invoices')
        .insert({
          student_id: invoiceData.studentId,
          student_name: invoiceData.studentName,
          lines: invoiceData.lines,
          subtotal: invoiceData.subtotal,
          lunch: invoiceData.lunch,
          lunch_amount: invoiceData.lunchAmount || 0,
          discount_amount: invoiceData.discountAmount || 0,
          discount_note: invoiceData.discountNote,
          total: invoiceData.total,
          paid: invoiceData.paid || 0,
          balance: invoiceData.balance,
          status: invoiceData.status,
          method: invoiceData.method,
          created_at: now,
          updated_at: now
        })
        .select('id')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data.id;
      })
    );
  }

  /**
   * Update an invoice
   */
  updateInvoice(id: string, updates: Partial<Invoice>): Observable<boolean> {
    const updateData: any = {
      updated_at: new Date().toISOString()
    };

    if (updates.status !== undefined) updateData.status = updates.status;
    if (updates.paid !== undefined) updateData.paid = updates.paid;
    if (updates.balance !== undefined) updateData.balance = updates.balance;
    if (updates.method !== undefined) updateData.method = updates.method;
    if (updates.discountAmount !== undefined) updateData.discount_amount = updates.discountAmount;
    if (updates.discountNote !== undefined) updateData.discount_note = updates.discountNote;

    return from(
      this.supabase.client
        .from('academy_invoices')
        .update(updateData)
        .eq('id', id)
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  /**
   * Get all payments, ordered by creation date descending
   */
  getPayments(): Observable<Payment[]> {
    return from(
      this.supabase.client
        .from('academy_payments')
        .select('*')
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapPaymentFromDb);
      }),
      catchError((error) => {
        if (error.code === 'PGRST301' || error.message?.includes('permission')) {
          return [];
        }
        console.error('Error fetching payments:', error);
        return throwError(() => error);
      })
    );
  }

  /**
   * Get payments for a specific invoice
   */
  getPaymentsByInvoice(invoiceId: string): Observable<Payment[]> {
    return from(
      this.supabase.client
        .from('academy_payments')
        .select('*')
        .eq('invoice_id', invoiceId)
        .order('created_at', { ascending: false })
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return (data || []).map(this.mapPaymentFromDb);
      })
    );
  }

  /**
   * Create a new payment
   */
  createPayment(paymentData: Omit<Payment, 'id' | 'createdAt'>): Observable<string> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('academy_payments')
        .insert({
          invoice_id: paymentData.invoiceId,
          student_id: paymentData.studentId,
          amount: paymentData.amount,
          method: paymentData.method,
          created_at: now
        })
        .select('id')
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) throw error;
        return data.id;
      })
    );
  }

  /**
   * Get pricing configuration
   */
  getPricing(): Observable<PricingDoc | null> {
    return from(
      this.supabase.client
        .from('academy_pricing')
        .select('*')
        .order('updated_at', { ascending: false })
        .limit(1)
        .single()
    ).pipe(
      map(({ data, error }) => {
        if (error) {
          if (error.code === 'PGRST116') return null;
          throw error;
        }
        return data ? this.mapPricingFromDb(data) : null;
      })
    );
  }

  /**
   * Update pricing configuration
   */
  updatePricing(pricing: PricingDoc): Observable<boolean> {
    const now = new Date().toISOString();
    return from(
      this.supabase.client
        .from('academy_pricing')
        .upsert({
          academy_prices: pricing.academyPrices,
          items: pricing.items,
          currency: pricing.currency || 'USD',
          lunch: pricing.lunch,
          updated_at: now
        })
    ).pipe(
      map(({ error }) => {
        if (error) throw error;
        return true;
      })
    );
  }

  // Helper methods for mapping database records to types

  private mapInvoiceFromDb(data: any): Invoice {
    return {
      id: data.id,
      studentId: data.student_id,
      studentName: data.student_name,
      lines: data.lines,
      subtotal: data.subtotal,
      lunch: data.lunch,
      lunchAmount: data.lunch_amount,
      discountAmount: data.discount_amount,
      discountNote: data.discount_note,
      total: data.total,
      paid: data.paid,
      balance: data.balance,
      status: data.status,
      method: data.method,
      createdAt: data.created_at,
      updatedAt: data.updated_at
    };
  }

  private mapPaymentFromDb(data: any): Payment {
    return {
      id: data.id,
      invoiceId: data.invoice_id,
      studentId: data.student_id,
      amount: data.amount,
      method: data.method,
      createdAt: data.created_at
    };
  }

  private mapPricingFromDb(data: any): PricingDoc {
    return {
      academyPrices: data.academy_prices || {},
      items: data.items,
      currency: data.currency,
      lunch: data.lunch,
      updatedAt: data.updated_at
    };
  }
}

