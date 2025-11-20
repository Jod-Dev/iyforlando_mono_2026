/**
 * Registration Types
 * Mapped from old dashboard Firebase/Firestore structure
 */

export interface Period {
  academy?: string;
  level?: string;
}

export interface Registration {
  id: string;
  firstName?: string;
  lastName?: string;
  cellNumber?: string;
  email?: string;
  city?: string;
  state?: string;
  birthday?: string; // ISO date string
  gender?: string;
  confirmEmail?: string;
  address?: string;
  zipCode?: string;
  age?: number | string;
  firstPeriod?: Period;
  secondPeriod?: Period;
  createdAt?: string; // ISO timestamp
  updatedAt?: string; // ISO timestamp
}

