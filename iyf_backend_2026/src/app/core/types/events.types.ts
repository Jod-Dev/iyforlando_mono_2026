/**
 * Event Types
 * Mapped from old dashboard Firebase/Firestore structure
 */

export interface Event {
  id: string;
  name: string;
  description?: string;
  date: string; // ISO date string
  startTime: string; // HH:mm format
  endTime: string; // HH:mm format
  location: string;
  status: EventStatus;
  qrCode?: string;
  createdAt: string; // ISO timestamp
  updatedAt?: string; // ISO timestamp
}

export type EventStatus = 'upcoming' | 'active' | 'completed' | 'cancelled';

export interface VolunteerHours {
  id: string;
  volunteerId: string; // volunteer code
  volunteerName: string;
  volunteerEmail: string;
  eventId: string;
  eventName: string;
  checkInTime?: string; // ISO timestamp
  checkOutTime?: string; // ISO timestamp
  checkInLocation?: {
    latitude: number;
    longitude: number;
    accuracy?: number;
    address?: string;
  };
  checkOutLocation?: {
    latitude: number;
    longitude: number;
    accuracy?: number;
    address?: string;
  };
  totalHours?: number;
  status: HoursStatus;
  notes?: string;
  createdAt: string; // ISO timestamp
  updatedAt?: string; // ISO timestamp
}

export type HoursStatus = 'checked-in' | 'checked-out' | 'completed';

export interface QRCodeData {
  type: 'check-in' | 'check-out';
  eventId: string;
  volunteerCode?: string;
  timestamp: number;
}

export interface VolunteerCode {
  id: string;
  code: string;
  volunteerName: string;
  volunteerEmail: string;
  eventId: string;
  isActive: boolean;
  createdAt: string; // ISO timestamp
  updatedAt?: string; // ISO timestamp
}

