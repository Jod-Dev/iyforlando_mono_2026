/**
 * Academy Types
 * Based on the JSON structure provided
 */

export interface Academy {
  id?: string;
  title: string;
  description: string;
  price: string;
  level: string;
  age: string;
  schedule: string[];
  image: string;
  tag: string;
  catchPhrase: string;
  goal: string[];
  equipment: string;
  academyDetailsImg: string;
  linkName: string;
  note: string[];
  status?: 'active' | 'inactive';
  created_at?: string;
  updated_at?: string;
}

/**
 * Academy form data (for create/edit)
 */
export interface AcademyFormData {
  title: string;
  description: string;
  price: string;
  level: string;
  age: string;
  schedule: string[];
  image: string;
  tag: string;
  catchPhrase: string;
  goal: string[];
  equipment: string;
  academyDetailsImg: string;
  linkName: string;
  note: string[];
  status?: 'active' | 'inactive';
}

