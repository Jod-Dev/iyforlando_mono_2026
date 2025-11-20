const fs = require('fs');
const path = require('path');

// Helper function to convert Firebase timestamp to PostgreSQL timestamp
function convertTimestamp(timestamp) {
  if (!timestamp) return 'NOW()';
  if (typeof timestamp === 'string') {
    return `'${timestamp}'::timestamp with time zone`;
  }
  return 'NOW()';
}

// Helper function to convert to PostgreSQL array
function convertArray(arr) {
  if (!arr || !Array.isArray(arr) || arr.length === 0) return 'ARRAY[]::text[]';
  return `ARRAY[${arr.map(item => `'${String(item).replace(/'/g, "''")}'`).join(', ')}]::text[]`;
}

// Helper function to convert to JSONB
function convertJSONB(obj) {
  if (!obj) return "'{}'::jsonb";
  return `'${JSON.stringify(obj).replace(/'/g, "''")}'::jsonb`;
}

// Helper function to escape SQL strings
function escapeSQL(str) {
  if (!str) return 'NULL';
  return `'${String(str).replace(/'/g, "''")}'`;
}

// Helper function to convert age string to integer
function convertAge(age) {
  if (!age) return 'NULL';
  const ageNum = parseInt(age);
  return isNaN(ageNum) ? 'NULL' : ageNum.toString();
}

// Process volunteer_applications
function processVolunteerApplications() {
  const filePath = path.join(__dirname, '../iyf_backend_2026/firestoredb/volunteer_applications.json');
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  
  const inserts = [];
  inserts.push('-- ============================================');
  inserts.push('-- Import Volunteer Applications from Firebase');
  inserts.push('-- ============================================\n');
  
  data.documents.forEach(doc => {
    const fields = [];
    const values = [];
    
    // Map Firebase fields to Supabase columns
    if (doc.id) fields.push('id'), values.push(`gen_random_uuid()`); // We'll use new UUIDs
    if (doc.firstName) fields.push('first_name'), values.push(escapeSQL(doc.firstName));
    if (doc.lastName) fields.push('last_name'), values.push(escapeSQL(doc.lastName));
    if (doc.email) fields.push('email'), values.push(escapeSQL(doc.email));
    if (doc.gender) fields.push('gender'), values.push(escapeSQL(doc.gender));
    if (doc.tshirtSize) fields.push('tshirt_size'), values.push(escapeSQL(doc.tshirtSize));
    if (doc.emergencyContact) fields.push('emergency_contact'), values.push(escapeSQL(doc.emergencyContact));
    if (doc.emergencyPhone) fields.push('emergency_phone'), values.push(escapeSQL(doc.emergencyPhone));
    if (doc.volunteerCode) fields.push('volunteer_code'), values.push(escapeSQL(doc.volunteerCode));
    if (doc.source) fields.push('source'), values.push(escapeSQL(doc.source));
    if (doc.eventInfoAccepted !== undefined) fields.push('event_info_accepted'), values.push(doc.eventInfoAccepted);
    if (doc.termsAccepted !== undefined) fields.push('terms_accepted'), values.push(doc.termsAccepted);
    if (doc.age) fields.push('age'), values.push(convertAge(doc.age));
    if (doc.cellNumber) fields.push('phone'), values.push(escapeSQL(doc.cellNumber));
    if (doc.city) fields.push('city'), values.push(escapeSQL(doc.city));
    if (doc.state) fields.push('state'), values.push(escapeSQL(doc.state));
    if (doc.country) fields.push('country'), values.push(escapeSQL(doc.country));
    if (doc.availability) fields.push('availability'), values.push(convertJSONB(doc.availability));
    if (doc.interests) fields.push('interests'), values.push(convertArray(doc.interests));
    if (doc.skills) fields.push('skills'), values.push(convertArray(doc.skills));
    if (doc.languages) fields.push('languages'), values.push(convertArray(doc.languages));
    if (doc.backgroundCheckCompleted !== undefined) fields.push('background_check_completed'), values.push(doc.backgroundCheckCompleted);
    if (doc.trainingCompleted !== undefined) fields.push('training_completed'), values.push(doc.trainingCompleted);
    if (doc.orientationAttended !== undefined) fields.push('orientation_attended'), values.push(doc.orientationAttended);
    if (doc.status) fields.push('status'), values.push(escapeSQL(doc.status));
    if (doc.notes) fields.push('notes'), values.push(escapeSQL(doc.notes));
    if (doc.createdAt) fields.push('created_at'), values.push(convertTimestamp(doc.createdAt));
    if (doc.updatedAt) fields.push('updated_at'), values.push(convertTimestamp(doc.updatedAt));
    
    if (fields.length > 0) {
      inserts.push(`INSERT INTO public.volunteer_applications (${fields.join(', ')})`);
      inserts.push(`VALUES (${values.join(', ')});`);
      inserts.push('');
    }
  });
  
  return inserts.join('\n');
}

// Process volunteer_schedule
function processVolunteerSchedule() {
  const filePath = path.join(__dirname, '../iyf_backend_2026/firestoredb/volunteer_schedule.json');
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  
  const inserts = [];
  inserts.push('-- ============================================');
  inserts.push('-- Import Volunteer Schedule from Firebase');
  inserts.push('-- ============================================\n');
  
  data.documents.forEach(doc => {
    const fields = [];
    const values = [];
    
    if (doc.volunteerName) fields.push('volunteer_name'), values.push(escapeSQL(doc.volunteerName));
    if (doc.volunteerEmail) fields.push('volunteer_email'), values.push(escapeSQL(doc.volunteerEmail));
    if (doc.volunteerCode) fields.push('volunteer_code'), values.push(escapeSQL(doc.volunteerCode));
    if (doc.selectedSlots) fields.push('selected_slots'), values.push(convertJSONB(doc.selectedSlots));
    if (doc.totalHours !== undefined) fields.push('total_hours'), values.push(doc.totalHours);
    if (doc.createdAt) fields.push('created_at'), values.push(convertTimestamp(doc.createdAt));
    if (doc.updatedAt) fields.push('updated_at'), values.push(convertTimestamp(doc.updatedAt));
    
    if (fields.length > 0) {
      inserts.push(`INSERT INTO public.volunteer_schedule (${fields.join(', ')})`);
      inserts.push(`VALUES (${values.join(', ')});`);
      inserts.push('');
    }
  });
  
  return inserts.join('\n');
}

// Process academy_payments
function processAcademyPayments() {
  const filePath = path.join(__dirname, '../iyf_backend_2026/firestoredb/academy_payments.json');
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  
  const inserts = [];
  inserts.push('-- ============================================');
  inserts.push('-- Import Academy Payments from Firebase');
  inserts.push('-- Note: invoice_id and student_id need to be mapped to existing UUIDs');
  inserts.push('-- ============================================\n');
  
  // We'll need to map Firebase IDs to UUIDs
  // For now, we'll insert with NULL foreign keys and note that they need to be updated
  data.documents.forEach(doc => {
    const fields = [];
    const values = [];
    
    // Store original Firebase IDs as comments for manual mapping
    if (doc.invoiceId) {
      inserts.push(`-- Original Firebase invoice_id: ${doc.invoiceId}`);
    }
    if (doc.studentId) {
      inserts.push(`-- Original Firebase student_id: ${doc.studentId}`);
    }
    
    // For now, we'll skip foreign keys and insert what we can
    // These will need to be updated manually after mapping
    if (doc.amount !== undefined) fields.push('amount'), values.push(doc.amount);
    if (doc.method) {
      // Map "discount" to a valid method or keep it if table allows it
      // For now, we'll use 'cash' as default for discount payments
      const method = doc.method === 'discount' ? 'cash' : doc.method;
      fields.push('method'), values.push(escapeSQL(method));
    }
    if (doc.createdAt) fields.push('created_at'), values.push(convertTimestamp(doc.createdAt));
    
    if (fields.length > 0) {
      inserts.push(`INSERT INTO public.academy_payments (${fields.join(', ')})`);
      inserts.push(`VALUES (${values.join(', ')});`);
      inserts.push('');
    }
  });
  
  return inserts.join('\n');
}

// Process fall_academy_2025 (academy registrations)
function processFallAcademy2025() {
  const filePath = path.join(__dirname, '../iyf_backend_2026/firestoredb/fall_academy_2025.json');
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  
  const inserts = [];
  inserts.push('-- ============================================');
  inserts.push('-- Import Fall Academy 2025 Registrations from Firebase');
  inserts.push('-- ============================================\n');
  
  data.documents.forEach(doc => {
    const fields = [];
    const values = [];
    
    // Map Firebase fields to Supabase columns
    if (doc.firstName) fields.push('first_name'), values.push(escapeSQL(doc.firstName));
    if (doc.lastName) fields.push('last_name'), values.push(escapeSQL(doc.lastName));
    if (doc.cellNumber) fields.push('cell_number'), values.push(escapeSQL(doc.cellNumber));
    if (doc.email) fields.push('email'), values.push(escapeSQL(doc.email));
    if (doc.city) fields.push('city'), values.push(escapeSQL(doc.city));
    if (doc.state) fields.push('state'), values.push(escapeSQL(doc.state));
    if (doc.birthday) {
      fields.push('birthday');
      // Convert ISO date string to DATE format
      const dateStr = doc.birthday.split('T')[0]; // Get just the date part
      values.push(`'${dateStr}'::date`);
    }
    if (doc.gender) fields.push('gender'), values.push(escapeSQL(doc.gender));
    if (doc.confirmEmail) fields.push('confirm_email'), values.push(escapeSQL(doc.confirmEmail));
    if (doc.address) fields.push('address'), values.push(escapeSQL(doc.address));
    if (doc.zipCode) fields.push('zip_code'), values.push(escapeSQL(doc.zipCode));
    if (doc.age) fields.push('age'), values.push(convertAge(doc.age));
    if (doc.firstPeriod) fields.push('first_period'), values.push(convertJSONB(doc.firstPeriod));
    if (doc.secondPeriod) fields.push('second_period'), values.push(convertJSONB(doc.secondPeriod));
    if (doc.createdAt) fields.push('created_at'), values.push(convertTimestamp(doc.createdAt));
    if (doc.updatedAt) fields.push('updated_at'), values.push(convertTimestamp(doc.updatedAt));
    
    if (fields.length > 0) {
      inserts.push(`INSERT INTO public.academy_registrations (${fields.join(', ')})`);
      inserts.push(`VALUES (${values.join(', ')});`);
      inserts.push('');
    }
  });
  
  return inserts.join('\n');
}

// Main function
function main() {
  let output = [];
  
  output.push('-- ============================================');
  output.push('-- Import Firebase Data to Supabase');
  output.push('-- Generated from Firebase JSON exports');
  output.push('-- ============================================\n');
  
  // Process each collection
  try {
    output.push(processVolunteerApplications());
    output.push('\n');
  } catch (error) {
    console.error('Error processing volunteer_applications:', error.message);
  }
  
  try {
    output.push(processVolunteerSchedule());
    output.push('\n');
  } catch (error) {
    console.error('Error processing volunteer_schedule:', error.message);
  }
  
  try {
    output.push(processAcademyPayments());
    output.push('\n');
  } catch (error) {
    console.error('Error processing academy_payments:', error.message);
  }
  
  try {
    output.push(processFallAcademy2025());
    output.push('\n');
  } catch (error) {
    console.error('Error processing fall_academy_2025:', error.message);
  }
  
  // Write to file
  const outputPath = path.join(__dirname, 'import-firebase-data.sql');
  fs.writeFileSync(outputPath, output.join('\n'));
  console.log(`SQL file generated: ${outputPath}`);
}

main();

