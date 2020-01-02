import { Address } from './address';
import { Account } from './account';

export interface Receptionist {
  id?: number;
  avatar?: string;
  birthDay?: string;
  firstName?: string;
  gender?: string;
  jobTitle?: string;
  lastName?: string;
  phoneNumber?: string;
  cin?: string;
  created_at?: string;
  updated_at?: string;
  address?: Address;
  account?: Account;
  gym_id?: number;
}
