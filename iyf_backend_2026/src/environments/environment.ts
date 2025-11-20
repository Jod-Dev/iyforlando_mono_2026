/**
 * Environment configuration for development
 * 
 * ⚠️ IMPORTANT: 
 * 1. Complete Supabase values from your .env file
 * 2. This file should NOT contain real values in production
 * 3. For production, use environment variables in Cloudflare Pages
 */

export const environment = {
  production: false,
  
  // Supabase Configuration
  // ⚠️ COMPLETE: Copy these values from your .env file
  // Or use: npm run start:dev (which loads from .env)
  supabaseUrl: 'https://onnpwusydqwyxvewmhci.supabase.co', 
  supabaseAnonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9ubnB3dXN5ZHF3eXh2ZXdtaGNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM1ODY0MDAsImV4cCI6MjA3OTE2MjQwMH0.1ZFDHjxdENM-NlNhgqel3BO8NElfdaaWS-0jh2g24kc',
  
  // Application Configuration
  appName: 'IYF Orlando Platform',
  appVersion: '1.0.0',
  
  // API Configuration
  apiUrl: '',
  
  // Feature Flags (if needed)
  features: {
    enableAnalytics: false,
    enableErrorReporting: false,
  },
  
  // Logging
  logLevel: 'debug',
};

