/**
 * Environment configuration for production
 * 
 * ⚠️ IMPORTANT: This file is safe to commit as it contains no secrets.
 * Actual secrets are loaded from environment variables at build time.
 */

export const environment = {
  production: true,
  
  // Supabase Configuration
  // These values MUST come from environment variables in production
  supabaseUrl: process.env['SUPABASE_URL'] || '',
  supabaseAnonKey: process.env['SUPABASE_ANON_KEY'] || '',
  
  // Application Configuration
  appName: 'IYF Orlando Platform',
  appVersion: '1.0.0',
  
  // API Configuration
  apiUrl: process.env['API_URL'] || '',
  
  // Feature Flags
  features: {
    enableAnalytics: true,
    enableErrorReporting: true,
  },
  
  // Logging
  logLevel: 'error', // Only log errors in production
};

