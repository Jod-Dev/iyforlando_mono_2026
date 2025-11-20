/**
 * Environment configuration for production
 * 
 * ⚠️ IMPORTANT: 
 * 1. In production, these values are injected from Cloudflare Pages
 * 2. DO NOT hardcode real values here
 * 3. Configure environment variables in Cloudflare Pages:
 *    - SUPABASE_URL
 *    - SUPABASE_ANON_KEY
 */

export const environment = {
  production: true,
  
  // Supabase Configuration
  // ⚠️ These values are injected at build time from Cloudflare Pages
  // Configure environment variables in Cloudflare Pages
  supabaseUrl: process.env['SUPABASE_URL'] || '', // Injected from Cloudflare Pages
  supabaseAnonKey: process.env['SUPABASE_ANON_KEY'] || '', // Injected from Cloudflare Pages
  
  // Application Configuration
  appName: 'IYF Orlando Platform',
  appVersion: '1.0.0',
  
  // API Configuration
  apiUrl: '',
  
  // Feature Flags
  features: {
    enableAnalytics: true,
    enableErrorReporting: true,
  },
  
  // Logging
  logLevel: 'error', // Only log errors in production
};

