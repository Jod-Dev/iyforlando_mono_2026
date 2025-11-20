/**
 * Script to create temporary admin user in Supabase
 * 
 * Usage:
 * 1. Set SUPABASE_SERVICE_ROLE_KEY in .env or environment
 * 2. Set SUPABASE_URL in .env or environment
 * 3. Run: node scripts/create-temp-admin.js
 * 
 * Or use the Supabase Dashboard method (recommended - see CREAR_USUARIO_TEMPORAL.md)
 */

require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  console.error('❌ ERROR: Missing required environment variables');
  console.error('Required: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
  console.error('\nYou can either:');
  console.error('1. Add them to .env file');
  console.error('2. Use Supabase Dashboard method (see CREAR_USUARIO_TEMPORAL.md)');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
});

async function createAdminUser() {
  const email = 'admin@iyforlando.org';
  const password = 'TempAdmin2026!';

  try {
    console.log('🔄 Creating admin user...');

    // Create user in auth
    const { data: authData, error: authError } = await supabase.auth.admin.createUser({
      email,
      password,
      email_confirm: true, // Auto-confirm email
      user_metadata: {
        first_name: 'Admin',
        last_name: 'IYF Orlando'
      }
    });

    if (authError) {
      if (authError.message.includes('already registered')) {
        console.log('⚠️  User already exists, updating profile...');
        // Get existing user
        const { data: existingUser } = await supabase.auth.admin.listUsers();
        const user = existingUser.users.find(u => u.email === email);
        
        if (!user) {
          throw new Error('User exists but could not be found');
        }

        // Update profile
        const { error: profileError } = await supabase
          .from('profiles')
          .upsert({
            id: user.id,
            email: email,
            first_name: 'Admin',
            last_name: 'IYF Orlando',
            role: 'admin',
            status: 'active'
          }, {
            onConflict: 'id'
          });

        if (profileError) throw profileError;

        console.log('✅ Admin profile updated successfully!');
        console.log(`\n📧 Email: ${email}`);
        console.log(`🔑 Password: ${password}`);
        console.log('\n⚠️  IMPORTANT: Change password after first login!');
        return;
      }
      throw authError;
    }

    if (!authData.user) {
      throw new Error('User creation failed - no user data returned');
    }

    console.log('✅ User created in auth, creating profile...');

    // Create profile with admin role
    const { error: profileError } = await supabase
      .from('profiles')
      .insert({
        id: authData.user.id,
        email: email,
        first_name: 'Admin',
        last_name: 'IYF Orlando',
        role: 'admin',
        status: 'active'
      });

    if (profileError) {
      // If profile already exists, update it
      if (profileError.code === '23505') {
        const { error: updateError } = await supabase
          .from('profiles')
          .update({
            role: 'admin',
            status: 'active'
          })
          .eq('id', authData.user.id);

        if (updateError) throw updateError;
        console.log('✅ Profile updated to admin');
      } else {
        throw profileError;
      }
    } else {
      console.log('✅ Profile created with admin role');
    }

    console.log('\n✅ Admin user created successfully!');
    console.log(`\n📧 Email: ${email}`);
    console.log(`🔑 Password: ${password}`);
    console.log('\n⚠️  IMPORTANT: Change password after first login!');
    console.log('\n🔗 Login at: http://localhost:4200/pages/authentication/sign-in/modern');

  } catch (error) {
    console.error('❌ Error creating admin user:', error.message);
    console.error('\n💡 Alternative: Use Supabase Dashboard method (see CREAR_USUARIO_TEMPORAL.md)');
    process.exit(1);
  }
}

createAdminUser();

