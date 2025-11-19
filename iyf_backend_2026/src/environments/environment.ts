/**
 * Environment configuration for development
 * 
 * ⚠️ IMPORTANT: This file is safe to commit as it contains no secrets.
 * Actual secrets are loaded from .env file at build time or runtime.
 */

export const environment = {
  production: false,
  
  // Supabase Configuration
  // These values should come from environment variables at build time
  supabaseUrl: process.env['SUPABASE_URL'] || '',
  supabaseAnonKey: process.env['SUPABASE_ANON_KEY'] || '',
  
  // Application Configuration
  appName: 'IYF Orlando Platform',
  appVersion: '1.0.0',
  
  // API Configuration
  apiUrl: process.env['API_URL'] || '',
  
  // Feature Flags (if needed)
  features: {
    enableAnalytics: false,
    enableErrorReporting: false,
  },
  
  // Logging
  logLevel: 'debug',
};

