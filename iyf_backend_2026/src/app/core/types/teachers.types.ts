/**
 * Teacher Types
 */

export interface Teacher {
  id?: string;
  profile_id?: string;
  first_name: string;
  last_name: string;
  email: string;
  phone?: string;
  avatar?: string;
  academy_id?: string;
  academy_name?: string;
  bio?: string;
  status?: 'active' | 'inactive';
  created_at?: string;
  updated_at?: string;
}

/**
 * Teacher form data (for create/edit)
 */
export interface TeacherFormData {
  first_name: string;
  last_name: string;
  email: string;
  phone?: string;
  avatar?: string;
  academy_id?: string;
  academy_name?: string;
  bio?: string;
  status?: 'active' | 'inactive';
}

