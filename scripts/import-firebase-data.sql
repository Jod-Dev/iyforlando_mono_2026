-- ============================================
-- Import Firebase Data to Supabase
-- Generated from Firebase JSON exports
-- ============================================

-- ============================================
-- Import Volunteer Applications from Firebase
-- ============================================

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Jod', 'Louis', 'ing.jod@gmail.com', 'Male', 'L', 'Michelle Morales', '(336) 807-3918', 'PBGCLV', 'website', true, true, 36, '(656) 200-7031', 'Tampa', 'approved', '2025-10-22T17:05:12.562Z'::timestamp with time zone, '2025-10-22T17:27:35.944Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Cristian ', 'Ruiz', 'cristian1997.cr1@gmail.com', 'Male', 'XL', 'Daniela', '(786) 602-6311', '88MMQS', 'website', false, true, 27, '(321) 444-0364', 'Deltona', '{"commitment":"one-time","flexible":false,"maxHoursPerDay":8,"days":[],"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T16:05:13.193Z'::timestamp with time zone, '2025-10-29T18:40:22.720Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Dylan', 'McRorie', 'loudchirp@gmail.com', 'Male', 'M', 'Duane', '(407) 312-1506', 'B8OLV0', 'website', false, true, 19, '(407) 493-5440', 'Orlando', '{"commitment":"one-time","times":[],"maxHoursPerDay":8,"days":[],"flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T17:57:14.128Z'::timestamp with time zone, '2025-10-29T18:41:25.224Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Myo', 'Lwe', 'myomyo777@yahoo.com', 'Female', 'L', 'Thin lwe', '(386) 717-6995', '20GNFS', 'website', false, true, 44, '(386) 748-5799', 'Deland', '{"flexible":false,"maxHoursPerDay":8,"times":[],"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:16:17.830Z'::timestamp with time zone, '2025-10-26T21:34:46.342Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Hyang ', 'Carton ', 'hyang1970@gmail.com', 'Female', 'M', 'Samuel Carton ', '(407) 558-8878', 'A7F59L', 'website', false, true, 55, '(407) 625-6701', 'Deltona ', '{"maxHoursPerDay":8,"times":[],"flexible":false,"commitment":"one-time","days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:15:20.951Z'::timestamp with time zone, '2025-10-26T21:35:00.052Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Noah', 'Henry', 'nicorp17@yahoo.com', 'Male', 'M', 'Everton Henry', '(727) 215-6472', 'N5WY30', 'website', false, true, 13, '(727) 215-6472', 'Sanford', '{"flexible":false,"commitment":"one-time","days":[],"maxHoursPerDay":8,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T20:41:43.792Z'::timestamp with time zone, '2025-10-29T20:48:27.502Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Aung', 'Pyo', 'apyo5757@gmail.com', 'Male', 'M', 'Myo lwe', '(386) 748-5799', 'VAD0HX', 'website', false, true, 33, '(386) 453-6528', 'Deland', '{"commitment":"one-time","days":[],"times":[],"flexible":false,"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T02:40:24.873Z'::timestamp with time zone, '2025-10-24T03:16:10.287Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Erika', 'Burns', 'erikaburns16@gmail.com', 'Female', 'M', 'John', '(321) 274-2675', '73A2B3', 'website', false, true, 27, '(407) 687-8985', 'Sanford', '{"days":[],"times":[],"maxHoursPerDay":8,"commitment":"one-time","flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T14:41:26.917Z'::timestamp with time zone, '2025-10-30T15:20:23.614Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Mariglorie', 'Berrocal', 'joy.berrocal@gmail.com', 'Female', 'XXL', 'Joy garcia', '(321) 331-2389', 'RJYFGT', 'website', false, true, 58, '(321) 331-2383', 'Altamonte springs', '{"flexible":false,"times":[],"maxHoursPerDay":8,"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T18:51:50.515Z'::timestamp with time zone, '2025-10-29T20:47:57.884Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Jonathan ', 'Acevedo', 'jonnacevedo1@gmail.com', 'Male', 'XXL', 'Sefora Acevedo', '(760) 716-7013', 'BP68ZO', 'website', false, true, 33, '(321) 369-8755', 'Orlando', '{"times":[],"flexible":false,"days":[],"maxHoursPerDay":8,"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T02:27:40.966Z'::timestamp with time zone, '2025-10-24T03:16:39.972Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Jennie', 'Godfrey', 'jggolf@proton.me', 'Female', 'M', 'Brady Godfrey', '(352) 408-6977', '4O87XW', 'website', false, true, 56, '(342) 406-9814', 'Leesburg', '{"flexible":false,"times":[],"maxHoursPerDay":8,"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T12:47:32.700Z'::timestamp with time zone, '2025-10-30T13:19:33.343Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Menorah', 'Lerhtoo', 'mnorahl817@gmail.com', 'Female', 'L', 'Ku Wah Say', '(919) 638-6928', 'A5VQBJ', 'website', false, true, 14, '(386) 450-2933', 'Deland', '{"times":[],"maxHoursPerDay":8,"days":[],"commitment":"one-time","flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T23:28:53.731Z'::timestamp with time zone, '2025-10-29T01:39:41.899Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Miyoung ', 'Walsh', 'miawalsh44@gmail.com', 'Female', 'M', 'John Walsh', '(305) 399-4686', '9J1W1W', 'website', false, true, 62, '(305) 322-8251', 'Sanford ', '{"days":[],"maxHoursPerDay":8,"flexible":false,"commitment":"one-time","times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:14:28.479Z'::timestamp with time zone, '2025-10-26T21:35:07.328Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Ruby', 'Lazo', 'rubyalazo@aol.com', 'Female', 'XL', 'Rafael Castillo', '(407) 221-2265', 'KKXJ8T', 'website', false, true, 40, '(407) 687-2175', 'Sanford ', '{"maxHoursPerDay":8,"days":[],"flexible":false,"times":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-25T01:32:25.844Z'::timestamp with time zone, '2025-10-25T16:03:31.644Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Eunji', 'Lee', 'eunjistory87@gmail.com', 'Female', 'XXXL', 'Eunju Lee', '(407) 867-7817', '4V5W7D', 'website', false, true, 38, '(407) 615-9813', 'Sanford', '{"maxHoursPerDay":8,"commitment":"one-time","days":[],"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T21:27:50.063Z'::timestamp with time zone, '2025-10-28T21:28:00.700Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Poe', 'Phyu', 'zenyoi80@gmail.com', 'Female', 'L', 'Zenyoi', '(407) 393-8462', 'FPIYTT', 'website', false, true, 15, '(407) 868-2613', 'Sanford', '{"times":[],"days":[],"flexible":false,"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T20:51:07.602Z'::timestamp with time zone, '2025-10-28T21:16:12.023Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Clary', 'Davis', 'kiara77davis@yahoo.com', 'Female', 'M', 'Kiara Peralta', '(407) 731-6162', '88UT72', 'website', false, true, 52, '(407) 731-6162', 'Orlando ', '{"maxHoursPerDay":8,"times":[],"flexible":false,"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T18:34:03.635Z'::timestamp with time zone, '2025-10-28T21:16:46.905Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Matthew ', 'Garcia', 'satarah1@gmail.com', 'Male', 'XXXL', 'Carolina Garcia', '(407) 860-3115', 'C40EX3', 'website', false, true, 25, '(407) 961-3884', 'Orlando', '{"maxHoursPerDay":8,"flexible":false,"commitment":"one-time","times":[],"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T16:57:17.911Z'::timestamp with time zone, '2025-10-29T18:41:03.603Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Ivan', 'Mendez', 'mricardo_ivan@hotmail.com', 'Male', 'L', 'Alexis Mendez', '(561) 187-8610', '5DUA40', 'website', false, true, 49, '(386) 538-3418', 'Orlando', '{"flexible":false,"maxHoursPerDay":8,"times":[],"commitment":"one-time","days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T11:43:24.704Z'::timestamp with time zone, '2025-10-30T13:19:18.161Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Karelle', 'Patterson', 'karellep10@gmail.com', 'Female', 'M', 'Andreas', '(772) 801-4250', '115VZW', 'website', false, true, 21, '(772) 361-5347', 'Fort Pierce', '{"maxHoursPerDay":8,"days":[],"flexible":false,"commitment":"one-time","times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T19:39:44.724Z'::timestamp with time zone, '2025-10-26T21:35:27.468Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Joseph', 'Choi', 'choi.joseph421@gmail.com', 'Male', 'M', 'Hannah Choi', '(407) 312-1656', 'XMFFQ8', 'website', false, true, 14, '(689) 777-2118', 'Sanford', '{"commitment":"one-time","days":[],"maxHoursPerDay":8,"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:13:13.879Z'::timestamp with time zone, '2025-10-26T21:35:53.372Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Norah', 'Sprott', 'sprottn48@gmail.com', 'Female', 'L', 'Susan Sprott', '(813) 291-5353', 'X9FZ8X', 'website', false, true, 21, '(813) 327-2108', 'Sanford', '{"times":[],"commitment":"one-time","maxHoursPerDay":8,"flexible":false,"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T03:11:35.974Z'::timestamp with time zone, '2025-10-30T13:19:05.297Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Jeyliah', 'Cifredo', 'jeynix2024@gmail.com', 'Female', 'XXL', 'Emily Cifredo', '(610) 451-3161', 'WW9SU1', 'website', false, true, 19, '(863) 279-7969', 'Lakeland', '{"days":[],"maxHoursPerDay":8,"flexible":false,"times":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-11-01T00:55:39.441Z'::timestamp with time zone, '2025-11-03T20:02:19.855Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Miyoung', 'Walsh', 'miawalsh44@gmail.com', 'Female', 'M', 'John Walsh ', '(305) 399-4686', 'HCTWT8', 'website', false, true, 63, '(305) 322-8251', 'Sanford ', '{"commitment":"one-time","days":[],"maxHoursPerDay":8,"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T03:05:17.239Z'::timestamp with time zone, '2025-10-30T13:18:56.725Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Itati', 'Chavez', 'chavezitati51@gmail.com', 'Female', 'M', 'Alexis Mendez', '(561) 187-8610', '3D0XPN', 'website', false, true, 24, '(557) 418-7145', 'Orlando', '{"times":[],"commitment":"one-time","flexible":false,"days":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T14:56:02.469Z'::timestamp with time zone, '2025-10-30T15:20:14.081Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Hannah', 'Choi', 'hannah@iyfusa.org', 'Female', 'S', 'Inho choi', '(407) 312-1656', 'N4G9EN', 'website', false, true, 44, '(407) 312-1656', 'Sanford', '{"flexible":false,"times":[],"maxHoursPerDay":8,"commitment":"one-time","days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T03:52:15.685Z'::timestamp with time zone, '2025-10-24T12:56:29.308Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Carol', 'Beyner ', 'carolbee42@gmail.com', 'Female', 'XXL', 'Yvonne Nelson', '(480) 242-6523', 'RWDE6I', 'website', false, true, 59, '(407) 415-4706', 'Sanford ', '{"days":[],"flexible":false,"commitment":"one-time","maxHoursPerDay":8,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T16:11:24.442Z'::timestamp with time zone, '2025-10-29T18:40:42.220Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Stephanie', 'Contreras', 'contrerasstephanie05@gmail.com', 'Female', 'M', 'Clary Davis', '(407) 731-6162', 'IA5ITT', 'website', false, true, 39, '(407) 764-3047', 'Kissimmee', '{"commitment":"one-time","flexible":false,"days":[],"maxHoursPerDay":8,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-11-05T13:27:18.475Z'::timestamp with time zone, '2025-11-05T14:24:10.504Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Ki Son', 'Pouncey', 'ki.son.pouncey@gmail.com', 'Female', 'L', 'Myron A.Pouncey', '(386) 682-6626', 'AW1VZ7', 'website', false, true, 75, '(386) 591-5859', 'Deltona', '{"days":[],"maxHoursPerDay":8,"commitment":"one-time","times":[],"flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T00:09:32.305Z'::timestamp with time zone, '2025-10-29T01:39:31.560Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Esiah', 'Cifredo', 'ecifredo@yahoo.com', 'Male', 'L', 'Emily ', '(610) 451-3161', '08B0MB', 'website', false, true, 14, '(610) 451-3161', 'Lake mary', '{"commitment":"one-time","days":[],"times":[],"flexible":false,"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T00:25:50.128Z'::timestamp with time zone, '2025-10-29T01:39:25.333Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Jenny', 'Lee', 'eunmilstory@gmail.com', 'Female', 'XL', 'Hye Kyung Kang ', '(407) 595-8675', 'JQ08G4', 'website', false, true, 24, '(407) 426-3362', 'Sanford ', '{"maxHoursPerDay":8,"days":[],"flexible":false,"times":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T17:20:16.574Z'::timestamp with time zone, '2025-10-24T17:28:24.391Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Connor', 'ODay', 'connoroday30@icloud.com', 'Male', 'M', 'Sani Mae', '(407) 802-0243', 'PTSH7V', 'website', false, true, 21, '(352) 989-2488', 'Montverde', '{"commitment":"one-time","flexible":false,"times":[],"days":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T19:04:44.878Z'::timestamp with time zone, '2025-10-28T21:16:33.042Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Hanna', 'Phyu', 'hannaphyu2012@gmail.com', 'Female', 'M', 'zenyoi', '(407) 393-8462', 'DO7URO', 'website', false, true, 13, '(407) 457-4520', 'sanford', '{"days":[],"times":[],"maxHoursPerDay":8,"flexible":false,"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T20:51:39.774Z'::timestamp with time zone, '2025-10-28T21:16:03.510Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Joy', 'Garcia', 'joy.m.garcia4@gmail.com', 'Female', 'M', 'Mariglorie Berrocal', '(321) 331-2383', 'BJA3SY', 'website', false, true, 35, '(321) 331-2389', 'Kissimmee', '{"times":[],"maxHoursPerDay":8,"days":[],"commitment":"one-time","flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T18:55:24.546Z'::timestamp with time zone, '2025-10-29T20:48:05.974Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'David ', 'Pradis ', 'pradis0118@gmail.com', 'Male', 'M', 'Michelle ', '(133) 680-7391', 'GTNYZM', 'website', false, true, 23, '(165) 621-5549', 'Tampa ', '{"maxHoursPerDay":8,"times":[],"flexible":false,"commitment":"one-time","days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:15:49.530Z'::timestamp with time zone, '2025-10-26T21:34:52.580Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Alexis', 'Mendez', 'alexismo1602@gmail.com', 'Male', 'L', 'Iván Méndez ', '(386) 538-3418', '2MQAQV', 'website', false, true, 26, '(561) 187-8610', 'Orlando', '{"flexible":false,"maxHoursPerDay":8,"times":[],"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-30T11:55:20.420Z'::timestamp with time zone, '2025-10-30T13:19:25.479Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Minkyun', 'Kang', 'Kangminkyun0929@gmail.com', 'Male', 'XXL', 'Minkyun', '(386) 999-1402', 'Q48YWF', 'website', false, true, 25, '(386) 999-1402', 'Sanford', '{"days":[],"maxHoursPerDay":8,"flexible":false,"commitment":"one-time","times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T21:25:37.490Z'::timestamp with time zone, '2025-10-28T21:27:51.966Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Champ ', 'Maung', 'pokomaung@yahoo.com', 'Male', 'L', '(407) 312-4028', '(407) 312-4028', 'TALXS2', 'website', false, true, 33, '(407) 227-6786', 'Orlando', '{"days":[],"commitment":"one-time","maxHoursPerDay":8,"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T13:37:44.759Z'::timestamp with time zone, '2025-10-28T13:38:55.617Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Hyekyung ', 'Kang', 'hyekyungk1111@gmail.com', 'Female', 'L', '2nd Oldest Daughter ', '(407) 615-9813', 'XS35I0', 'website', false, true, 62, '(407) 595-8675', 'Sanford ', '{"days":[],"commitment":"one-time","flexible":false,"times":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-27T14:24:28.697Z'::timestamp with time zone, '2025-10-27T18:20:09.446Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Eunju ', 'Lee', 'eunjoolee0110@gmail.com', 'Female', 'XL', 'Eunju Lee', '(407) 615-9813', '7O784Q', 'website', false, true, 36, '(407) 867-7817', 'Sanford', '{"times":[],"commitment":"one-time","days":[],"maxHoursPerDay":8,"flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T16:23:44.805Z'::timestamp with time zone, '2025-10-28T21:15:56.330Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Ku', 'Say', 'kukupoe7@gmail.com', 'Female', 'L', 'Hser', '(919) 744-4897', 'V6NP1G', 'website', false, true, 40, '(919) 638-6928', 'Deland', '{"days":[],"maxHoursPerDay":8,"commitment":"one-time","times":[],"flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T12:13:26.236Z'::timestamp with time zone, '2025-10-24T12:56:15.406Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'jinkyo', 'choi', 'williamjk1210@gmail.com', 'Male', 'L', 'eunhwa lee', '(689) 331-3595', 'WEXKWN', 'website', false, true, 35, '(689) 332-8849', 'sanford', '{"flexible":false,"commitment":"one-time","times":[],"maxHoursPerDay":8,"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T22:40:31.587Z'::timestamp with time zone, '2025-10-27T02:11:01.368Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Emily ', 'Cifredo', 'ecifredo@yahoo.com', 'Female', 'L', 'Emily cifredo', '(610) 451-3161', 'VELZKA', 'website', false, true, 40, '(610) 451-3161', 'Lake Mary ', '{"flexible":false,"days":[],"commitment":"one-time","times":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T20:19:21.280Z'::timestamp with time zone, '2025-10-26T21:34:37.416Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Minkyun', 'Kang', 'Minkyun0929@gmail.com', 'Male', 'XXL', 'Minkyun kang', '(386) 999-1402', 'I3AB1Q', 'website', false, true, 25, '(386) 999-1402', 'Sanford', '{"flexible":false,"maxHoursPerDay":8,"times":[],"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T16:07:36.585Z'::timestamp with time zone, '2025-10-29T18:40:33.075Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Josemeire', 'Renzi', 'Josiemrenzi@gmail.com', 'Female', 'S', 'Josemeire Renzi', '(914) 370-0115', 'LXKBXF', 'website', false, true, 46, '(914) 370-0115', 'Kissimmee', '{"times":[],"flexible":false,"days":[],"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T22:08:56.347Z'::timestamp with time zone, '2025-10-25T00:44:51.434Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Stephanie', 'Vasquez', 'esvasquez90@gmail.com', 'Female', 'S', 'Iris Vasquez ', '(863) 409-6610', 'VAU2F0', 'website', false, true, 35, '(863) 370-6824', 'Lakeland', '{"flexible":false,"days":[],"maxHoursPerDay":8,"commitment":"one-time","times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T23:40:37.781Z'::timestamp with time zone, '2025-10-25T00:45:01.524Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Carolina ', 'Garcia ', 'satarah1@gmail.com', 'Female', 'XXXL', 'Eliza Garcia', '(407) 280-8857', '6F23B9', 'website', false, true, 46, '(407) 860-3115', 'Apopka', '{"maxHoursPerDay":8,"times":[],"commitment":"one-time","flexible":false,"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T20:05:26.747Z'::timestamp with time zone, '2025-10-28T21:16:20.368Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'David', 'Munch', 'dmunch123@yahoo.com', 'Male', 'M', 'Carol Beyner', '(407) 415-4706', 'ZKX862', 'website', false, true, 30, '(407) 415-8564', 'Sanford', '{"flexible":false,"times":[],"maxHoursPerDay":8,"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T16:20:02.639Z'::timestamp with time zone, '2025-10-29T18:40:50.731Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Corbin ', 'Williams ', 'corbinjw24@gmail.com', 'Male', 'XL', 'JooHee ', '(321) 223-4594', 'DZ9W8U', 'website', false, true, 33, '(321) 615-0053', 'Cocoa', '{"commitment":"one-time","maxHoursPerDay":8,"flexible":false,"times":[],"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T19:00:13.893Z'::timestamp with time zone, '2025-10-24T19:41:57.515Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Ursula', 'Terry', 'ursulaterry@gmail.com', 'Female', 'XL', 'Grozny Terry', '(813) 812-0018', '7XZFHF', 'website', false, true, 39, '(813) 816-3259', 'Tampa', '{"days":[],"times":[],"flexible":false,"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T21:53:57.685Z'::timestamp with time zone, '2025-10-28T22:43:11.377Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Errol', 'Henry', 'n2prick@yahoo.com', 'Male', 'L', 'Everton Henry', '(727) 215-6472', '1AHZ6R', 'website', false, true, 48, '(727) 215-6472', 'Sanford', '{"commitment":"one-time","days":[],"maxHoursPerDay":8,"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T21:46:03.252Z'::timestamp with time zone, '2025-10-30T00:04:30.345Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Karla ', 'Ruiz ', 'karlaeruiz@yahoo.com', 'Male', 'L', 'Clary Davis ', '(407) 731-6162', '0ZE36T', 'website', false, true, 59, '(407) 446-2537', 'Orlando ', '{"commitment":"one-time","days":[],"flexible":false,"maxHoursPerDay":8,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T17:10:20.685Z'::timestamp with time zone, '2025-10-29T18:41:12.513Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Tong ki', 'Galun', 'kimtongki@gmail.com', 'Female', 'XL', 'Craig Galun ', '(321) 277-0060', 'TD1IUV', 'website', false, true, 57, '(321) 356-6730', 'Winter spring ', '{"days":[],"commitment":"one-time","flexible":false,"maxHoursPerDay":8,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T09:10:21.597Z'::timestamp with time zone, '2025-10-29T12:04:12.001Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Sivaraman ', 'Thulasi', 'sivasasi2021@gmail.com', 'Male', 'M', 'Sasirekha', '(407) 417-1987', '15XQH6', 'website', false, true, 39, '(689) 209-7035', 'Sanford', '{"days":[],"flexible":false,"times":[],"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T23:35:36.092Z'::timestamp with time zone, '2025-10-29T01:39:49.016Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Daniel', 'choi', 'danielchoi0423@gmail.com', 'Male', 'M', 'Hannah ', '(407) 312-1656', 'UFOO23', 'website', false, true, 17, '(321) 604-5584', 'Sanford ', '{"flexible":false,"maxHoursPerDay":8,"days":[],"commitment":"one-time","times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T21:19:47.271Z'::timestamp with time zone, '2025-10-28T21:27:44.266Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Joohee', 'Williams ', 'angeljookim@gmail.com', 'Female', 'S', 'Corbin Williams ', '(321) 615-0053', 'OZ2UUQ', 'website', false, true, 29, '(321) 223-4593', 'Cocoa', '{"times":[],"commitment":"one-time","flexible":false,"days":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T18:51:54.593Z'::timestamp with time zone, '2025-10-24T19:42:07.020Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Anaheli', 'Vargas', 'anahelig2012@gmail.com', 'Female', 'L', 'Rogmig Alvarado', '(407) 807-3604', 'MYQC3Y', 'website', false, true, 40, '(407) 669-5502', 'Sanford ', '{"flexible":false,"maxHoursPerDay":8,"commitment":"one-time","days":[],"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T01:25:18.571Z'::timestamp with time zone, '2025-10-29T01:39:17.943Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Tyler', 'Douglas', 'tylerdouglas2017@gmail.com', 'Male', 'L', 'Tyler Douglas', '(850) 530-6306', 'WPN4DK', 'website', false, true, 20, '(850) 530-6306', 'Sanford', '{"commitment":"one-time","days":[],"maxHoursPerDay":8,"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T21:53:26.207Z'::timestamp with time zone, '2025-10-26T22:08:05.196Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Eunhwa', 'Lee', 'Eunhwalee0607@gmail.com', 'Female', 'XXL', 'Jinkyo Choi', '(689) 332-8849', 'HYFSHB', 'website', false, true, 40, '(689) 331-3595', 'Sanford', '{"flexible":false,"times":[],"maxHoursPerDay":8,"commitment":"one-time","days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-25T13:45:31.995Z'::timestamp with time zone, '2025-10-25T16:03:22.989Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'David', 'Choi', 'dchoi2210@gmail.com', 'Male', 'M', 'Hannah', '(407) 312-1656', 'GNTM8Z', 'website', false, true, 18, '(689) 230-4762', 'Sanford', '{"maxHoursPerDay":8,"flexible":false,"commitment":"one-time","days":[],"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T18:03:10.390Z'::timestamp with time zone, '2025-10-29T18:41:32.028Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Chaw ', 'Khaing', 'mudu92@yahoo.com', 'Female', 'L', 'Chaw', '(407) 416-6177', 'AYZXYP', 'website', false, true, 33, '(407) 416-6177', 'Osteen', '{"commitment":"one-time","times":[],"days":[],"maxHoursPerDay":8,"flexible":false}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T19:26:12.971Z'::timestamp with time zone, '2025-10-28T21:16:26.831Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Michelle ', 'Morales pradis ', 'michellemoralespradis@gmail.com', 'Female', 'XL', 'Jod Louis ', '(656) 200-7031', 'DCRXVI', 'website', false, true, 32, '(336) 807-3918', 'Tampa', '{"times":[],"flexible":false,"days":[],"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-25T15:47:27.103Z'::timestamp with time zone, '2025-10-25T16:03:14.305Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Andreas ', 'Patterson ', 'metorstorm@gmail.com', 'Male', 'XXL', 'Eva Patterson', '(772) 332-1097', 'K4S2HF', 'website', false, true, 55, '(772) 801-4250', 'Fort Pierce', '{"commitment":"one-time","maxHoursPerDay":8,"days":[],"flexible":false,"times":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T19:46:45.553Z'::timestamp with time zone, '2025-10-26T21:35:44.179Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Tevin', 'Im', 'imtevin@gmail.com', 'Male', 'XL', 'Eunju Lee', '(407) 867-7817', '9WCD59', 'website', false, true, 39, '(407) 810-2341', 'Sanford', '{"commitment":"one-time","days":[],"times":[],"flexible":false,"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T02:23:15.568Z'::timestamp with time zone, '2025-10-24T03:17:03.917Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Sani', 'Mae', 'sanithoon2004@gmail.com', 'Female', 'XS', 'Connor', '(352) 989-2488', 'K3Q716', 'website', false, true, 21, '(407) 802-0243', 'Orlando', '{"flexible":false,"days":[],"maxHoursPerDay":8,"times":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-28T18:38:40.856Z'::timestamp with time zone, '2025-10-28T21:16:38.653Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Haeun', 'Ryu', 'haeun9342@naver.com', 'Female', 'M', 'Hanna 사모님', '(407) 312-1656', 'JZDPO3', 'website', false, true, 23, '(689) 298-3302', 'Sanford', '{"maxHoursPerDay":8,"times":[],"flexible":false,"days":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-26T22:04:10.674Z'::timestamp with time zone, '2025-10-26T22:08:53.004Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Brigitte ', 'Santana ', 'guirufita@hotmail.com', 'Female', 'L', 'Allan Amado', '(407) 923-1540', 'RPEX0R', 'website', false, true, 40, '(407) 923-1287', 'Davenport ', '{"flexible":false,"days":[],"times":[],"maxHoursPerDay":8,"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T02:37:28.613Z'::timestamp with time zone, '2025-10-24T03:16:25.087Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Brother ', 'Cifredo', 'cifredo@yahoo.com', 'Male', 'XL', 'Emily Cifredo', '(610) 451-3161', 'AADFT2', 'website', false, true, 42, '(941) 877-4905', 'Lake Mary', '{"flexible":false,"times":[],"commitment":"one-time","maxHoursPerDay":8,"days":[]}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-29T19:51:48.508Z'::timestamp with time zone, '2025-10-29T20:48:16.078Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Sefora', 'Acevedo', 'sefiekix94@gmail.com', 'Female', 'XXL', 'Jonathan Acevedo', '(321) 369-8755', '3239HO', 'website', false, true, 31, '(760) 716-7013', 'Orlando', '{"days":[],"flexible":false,"maxHoursPerDay":8,"times":[],"commitment":"one-time"}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-24T02:25:28.100Z'::timestamp with time zone, '2025-10-24T03:16:51.699Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Susan', 'Sprott', 'sprottsusane@gmail.com', 'Female', 'L', 'Gary Sprott', '(813) 618-2389', 'TO4XIS', 'website', false, true, 58, '(813) 563-5820', 'Sanford', '{"days":[],"times":[],"flexible":false,"commitment":"one-time","maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-10-27T15:56:33.975Z'::timestamp with time zone, '2025-10-27T18:20:16.240Z'::timestamp with time zone);

INSERT INTO public.volunteer_applications (id, first_name, last_name, email, gender, tshirt_size, emergency_contact, emergency_phone, volunteer_code, source, event_info_accepted, terms_accepted, age, phone, city, availability, interests, skills, languages, status, created_at, updated_at)
VALUES (gen_random_uuid(), 'Johannah', 'Lwe', 'backinwhy9537@gmail.com', 'Female', 'L', 'Myo Lwe', '(386) 748-5799', '0EQ3QV', 'website', false, true, 16, '(386) 337-2274', 'DeLand', '{"commitment":"one-time","days":[],"flexible":false,"times":[],"maxHoursPerDay":8}'::jsonb, ARRAY[]::text[], ARRAY[]::text[], ARRAY['English']::text[], 'approved', '2025-11-01T17:36:05.390Z'::timestamp with time zone, '2025-11-03T20:02:05.251Z'::timestamp with time zone);



-- ============================================
-- Import Volunteer Schedule from Firebase
-- ============================================

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Sani Mae', 'sanithoon2004@gmail.com', 'K3Q716', '[{"startTime":"4:00 PM","endTime":"8:00 PM","hours":4,"date":"Saturday, November 1, 2025","id":"Saturday__November_1__2025_4_00_PM_8_00_PM"}]'::jsonb, 4, '2025-10-28T18:41:48.624Z'::timestamp with time zone, '2025-10-28T18:41:48.624Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Ruby Lazo', 'rubyalazo@aol.com', 'KKXJ8T', '[{"endTime":"10:00 PM","id":"Friday__November_7__2025_6_00_PM_10_00_PM","startTime":"6:00 PM","date":"Friday, November 7, 2025","hours":4},{"date":"Sunday, November 2, 2025","id":"Sunday__November_2__2025_5_00_PM_7_00_PM","startTime":"5:00 PM","endTime":"7:00 PM","hours":2}]'::jsonb, 6, '2025-10-25T01:35:27.549Z'::timestamp with time zone, '2025-10-28T18:13:47.482Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Tevin Im', 'imtevin@gmail.com', '9WCD59', '[{"endTime":"8:00 PM","id":"Monday__October_27__2025_6_00_PM_8_00_PM","date":"Monday, October 27, 2025","hours":2,"startTime":"6:00 PM"},{"hours":1,"date":"Tuesday, October 28, 2025","id":"Tuesday__October_28__2025_7_00_PM_8_00_PM","endTime":"8:00 PM","startTime":"7:00 PM"},{"date":"Monday, November 3, 2025","hours":2,"startTime":"6:00 PM","id":"Monday__November_3__2025_6_00_PM_8_00_PM","endTime":"8:00 PM"},{"startTime":"7:00 PM","hours":1,"id":"Tuesday__November_4__2025_7_00_PM_8_00_PM","date":"Tuesday, November 4, 2025","endTime":"8:00 PM"}]'::jsonb, 6, '2025-10-24T02:43:01.208Z'::timestamp with time zone, '2025-10-24T02:43:01.208Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Susan Sprott', 'sprottsusane@gmail.com', 'TO4XIS', '[{"startTime":"11:00 AM","date":"Tuesday, October 28, 2025","endTime":"2:00 PM","id":"Tuesday__October_28__2025_11_00_AM_2_00_PM","hours":3},{"endTime":"2:00 PM","hours":3,"startTime":"11:00 AM","id":"Thursday__October_30__2025_11_00_AM_2_00_PM","date":"Thursday, October 30, 2025"},{"id":"Monday__November_3__2025_11_00_AM_2_00_PM","startTime":"11:00 AM","hours":3,"date":"Monday, November 3, 2025","endTime":"2:00 PM"},{"date":"Tuesday, November 4, 2025","endTime":"2:00 PM","startTime":"11:00 AM","id":"Tuesday__November_4__2025_11_00_AM_2_00_PM","hours":3},{"endTime":"2:00 PM","hours":3,"id":"Thursday__November_6__2025_11_00_AM_2_00_PM","startTime":"11:00 AM","date":"Thursday, November 6, 2025"}]'::jsonb, 15, '2025-10-27T16:05:58.646Z'::timestamp with time zone, '2025-10-27T16:05:58.646Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Sefora Acevedo', 'sefiekix94@gmail.com', '3239HO', '[{"startTime":"10:00 AM","id":"Monday__October_27__2025_10_00_AM_8_00_PM","date":"Monday, October 27, 2025","hours":10,"endTime":"8:00 PM"}]'::jsonb, 10, '2025-10-24T02:27:30.528Z'::timestamp with time zone, '2025-10-24T02:28:20.407Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Dylan McRorie', 'loudchirp@gmail.com', 'B8OLV0', '[{"id":"Sunday__November_2__2025_11_00_AM_2_00_PM","date":"Sunday, November 2, 2025","endTime":"2:00 PM","hours":3,"startTime":"11:00 AM"}]'::jsonb, 3, '2025-10-29T18:00:04.475Z'::timestamp with time zone, '2025-10-29T18:00:04.475Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Erika Burns', 'erikaburns16@gmail.com', '73A2B3', '[{"startTime":"8:00 PM","date":"Wednesday, November 5, 2025","id":"Wednesday__November_5__2025_8_00_PM_10_00_PM","hours":2,"endTime":"10:00 PM"},{"id":"Thursday__November_6__2025_8_00_PM_10_00_PM","hours":2,"startTime":"8:00 PM","date":"Thursday, November 6, 2025","endTime":"10:00 PM"},{"hours":6,"date":"Friday, November 7, 2025","id":"Friday__November_7__2025_4_00_PM_10_00_PM","endTime":"10:00 PM","startTime":"4:00 PM"}]'::jsonb, 10, '2025-10-30T14:51:49.265Z'::timestamp with time zone, '2025-10-30T14:51:49.265Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Daniel choi', 'danielchoi0423@gmail.com', 'UFOO23', '[{"id":"Thursday__October_30__2025_6_00_PM_10_00_PM","hours":4,"date":"Thursday, October 30, 2025","endTime":"10:00 PM","startTime":"6:00 PM"}]'::jsonb, 4, '2025-10-30T22:32:38.173Z'::timestamp with time zone, '2025-10-30T22:32:38.173Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Connor ODay', 'connoroday30@icloud.com', 'PTSH7V', '[{"endTime":"8:00 PM","id":"Saturday__November_1__2025_4_00_PM_8_00_PM","hours":4,"startTime":"4:00 PM","date":"Saturday, November 1, 2025"}]'::jsonb, 4, '2025-10-28T19:06:03.276Z'::timestamp with time zone, '2025-10-28T19:06:03.276Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Carol Beyner ', 'carolbee42@gmail.com', 'RWDE6I', '[{"id":"Saturday__November_1__2025_1_00_PM_4_00_PM","date":"Saturday, November 1, 2025","hours":3,"startTime":"1:00 PM","endTime":"4:00 PM"}]'::jsonb, 3, '2025-10-29T16:14:26.193Z'::timestamp with time zone, '2025-10-29T16:14:26.193Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Hyang  Carton ', 'hyang1970@gmail.com', 'A7F59L', '[{"endTime":"8:00 PM","startTime":"1:00 PM","date":"Saturday, November 1, 2025","hours":7,"id":"Saturday__November_1__2025_1_00_PM_8_00_PM"},{"startTime":"1:00 PM","date":"Tuesday, November 4, 2025","hours":7,"id":"Tuesday__November_4__2025_1_00_PM_8_00_PM","endTime":"8:00 PM"},{"id":"Thursday__November_6__2025_1_00_PM_8_00_PM","hours":7,"startTime":"1:00 PM","date":"Thursday, November 6, 2025","endTime":"8:00 PM"},{"startTime":"3:00 PM","endTime":"8:00 PM","hours":5,"date":"Friday, November 7, 2025","id":"Friday__November_7__2025_3_00_PM_8_00_PM"}]'::jsonb, 26, '2025-10-26T20:24:02.261Z'::timestamp with time zone, '2025-10-26T20:24:02.261Z'::timestamp with time zone);

INSERT INTO public.volunteer_schedule (volunteer_name, volunteer_email, volunteer_code, selected_slots, total_hours, created_at, updated_at)
VALUES ('Jod Louis', 'ing.jod@gmail.com', 'PBGCLV', '[{"id":"Monday__October_27__2025_9_00_AM_10_00_PM","startTime":"9:00 AM","hours":13,"endTime":"10:00 PM","date":"Monday, October 27, 2025"},{"date":"Tuesday, October 28, 2025","startTime":"9:00 AM","endTime":"10:00 PM","id":"Tuesday__October_28__2025_9_00_AM_10_00_PM","hours":13},{"date":"Wednesday, October 29, 2025","startTime":"9:00 AM","endTime":"10:00 PM","id":"Wednesday__October_29__2025_9_00_AM_10_00_PM","hours":13},{"endTime":"10:00 PM","id":"Thursday__October_30__2025_9_00_AM_10_00_PM","date":"Thursday, October 30, 2025","startTime":"9:00 AM","hours":13},{"startTime":"9:00 AM","id":"Friday__October_31__2025_9_00_AM_10_00_PM","endTime":"10:00 PM","date":"Friday, October 31, 2025","hours":13},{"hours":13,"endTime":"10:00 PM","startTime":"9:00 AM","date":"Monday, November 3, 2025","id":"Monday__November_3__2025_9_00_AM_10_00_PM"},{"id":"Wednesday__November_5__2025_9_00_AM_10_00_PM","date":"Wednesday, November 5, 2025","startTime":"9:00 AM","endTime":"10:00 PM","hours":13},{"id":"Friday__November_7__2025_9_00_AM_10_00_PM","endTime":"10:00 PM","date":"Friday, November 7, 2025","hours":13,"startTime":"9:00 AM"},{"id":"Thursday__November_6__2025_9_00_AM_10_00_PM","date":"Thursday, November 6, 2025","hours":13,"startTime":"9:00 AM","endTime":"10:00 PM"},{"date":"Tuesday, November 4, 2025","endTime":"10:00 PM","hours":13,"id":"Tuesday__November_4__2025_9_00_AM_10_00_PM","startTime":"9:00 AM"}]'::jsonb, 130, '2025-10-26T22:13:50.049Z'::timestamp with time zone, '2025-11-03T20:13:31.364Z'::timestamp with time zone);



-- ============================================
-- Import Academy Payments from Firebase
-- Note: invoice_id and student_id need to be mapped to existing UUIDs
-- ============================================

-- Original Firebase invoice_id: QDE46Zl4gRFsXHYHQdDy
-- Original Firebase student_id: uIlO3wT2gPrnMM82ZJKg
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T16:49:13.173Z'::timestamp with time zone);

-- Original Firebase invoice_id: WRmW9GxhPOcNTDclADo4
-- Original Firebase student_id: TYJIiSz6GYuYyxKav4FA
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'cash', '2025-08-23T16:49:19.454Z'::timestamp with time zone);

-- Original Firebase invoice_id: eQIHQdGgTabjsOlESjr9
-- Original Firebase student_id: ef6bcFPlK58pWXgZK7O2
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-23T17:14:49.792Z'::timestamp with time zone);

-- Original Firebase invoice_id: 17QMqxUegBQHDxSj4oWc
-- Original Firebase student_id: gqf8PIPsnBDIKB5XtE0i
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T16:38:56.693Z'::timestamp with time zone);

-- Original Firebase invoice_id: 3d4SgW6NRPh1saleUCB3
-- Original Firebase student_id: 0pls9v9mBdxaDs9gvezQ
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-30T18:12:21.026Z'::timestamp with time zone);

-- Original Firebase invoice_id: JYjQ1k5MJ3C5A94MwXHs
-- Original Firebase student_id: IpbYJ0LgIL8ka4bGrvAr
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-30T14:55:01.852Z'::timestamp with time zone);

-- Original Firebase invoice_id: eX96X02hFtpNcPkBfWQt
-- Original Firebase student_id: cZFQDbZ2AkCxEbfbmLk9
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T14:02:17.183Z'::timestamp with time zone);

-- Original Firebase invoice_id: M5NqyP5prX3kiUDGDiwE
-- Original Firebase student_id: SeX7CVtj7cofIGhBc3IM
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-23T17:28:29.296Z'::timestamp with time zone);

-- Original Firebase invoice_id: G0eeb86LstedFPT9XJws
-- Original Firebase student_id: ML3Qmv15anbwGz53iOGh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-11-15T17:54:48.947Z'::timestamp with time zone);

-- Original Firebase invoice_id: HZTuPTPlLzgXDxr0nbfT
-- Original Firebase student_id: ZrG3rWnTOErqpYHsNcrI
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T14:12:19.052Z'::timestamp with time zone);

-- Original Firebase invoice_id: SpHtoAS32lpWuOSbG6GV
-- Original Firebase student_id: s1r39eJN6MdBEI1bT9rz
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:50:35.759Z'::timestamp with time zone);

-- Original Firebase invoice_id: sHED5xhlewiAIqtJmLuO
-- Original Firebase student_id: udpngi30PaSxrVMLIq8v
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-16T14:00:19.512Z'::timestamp with time zone);

-- Original Firebase invoice_id: l4Bqib5Inv2xSmYG7hry
-- Original Firebase student_id: ykYwTu32jtdwk1gFz20W
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (160, 'zelle', '2025-08-16T16:53:26.054Z'::timestamp with time zone);

-- Original Firebase invoice_id: yRiJCIi8b4oTGp0kbxGF
-- Original Firebase student_id: JYkVo8Qm5N5H7Sw3wfO4
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:44:41.888Z'::timestamp with time zone);

-- Original Firebase invoice_id: 8J0U1qrnwoNvnqcqZi7d
-- Original Firebase student_id: RBgkAt1DKRYAE8yL93Dd
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-16T16:54:09.422Z'::timestamp with time zone);

-- Original Firebase invoice_id: RL6rkFYiq3eRKaCGTnkM
-- Original Firebase student_id: sW9YUQ7mh5g4f5I2MTWz
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-30T16:48:52.480Z'::timestamp with time zone);

-- Original Firebase invoice_id: 4QUHtFPHICsG59kieb8B
-- Original Firebase student_id: Y5LVFtDZykWpmyyxO6m4
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (150, 'zelle', '2025-08-30T16:43:33.994Z'::timestamp with time zone);

-- Original Firebase invoice_id: RL6rkFYiq3eRKaCGTnkM
-- Original Firebase student_id: sW9YUQ7mh5g4f5I2MTWz
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-23T14:03:34.860Z'::timestamp with time zone);

-- Original Firebase invoice_id: W6OLV7ECWqtMjEQKTQNb
-- Original Firebase student_id: HyyIL7cqWXkaw15rFlek
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (160, 'cash', '2025-08-16T13:20:40.733Z'::timestamp with time zone);

-- Original Firebase invoice_id: WRmW9GxhPOcNTDclADo4
-- Original Firebase student_id: TYJIiSz6GYuYyxKav4FA
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-23T16:49:56.885Z'::timestamp with time zone);

-- Original Firebase invoice_id: ntEN3FyoGudXsBjk8PpS
-- Original Firebase student_id: TDPfWeQd8cgDn6W3642R
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (140, 'cash', '2025-08-16T16:41:12.639Z'::timestamp with time zone);

-- Original Firebase invoice_id: GBpW3SNUG599jZfCL89s
-- Original Firebase student_id: 8m6Gq3xal2qcLLQoR14x
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-09-07T12:55:44.127Z'::timestamp with time zone);

-- Original Firebase invoice_id: AZIFkdMR5X2cLirHKla2
-- Original Firebase student_id: t4u0mkEfjTmrM40Olcmd
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-23T17:15:10.223Z'::timestamp with time zone);

-- Original Firebase invoice_id: Pm7BVuEHBpv9gWaIW1h8
-- Original Firebase student_id: dHNloK54dHDSmmSctNxh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (160, 'cash', '2025-08-16T13:21:57.549Z'::timestamp with time zone);

-- Original Firebase invoice_id: EAKHXqimO6ZOjUOIHZUA
-- Original Firebase student_id: eW9NVCRM4iynPBvbO0hI
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (160, 'zelle', '2025-08-16T16:53:47.556Z'::timestamp with time zone);

-- Original Firebase invoice_id: CUIqs54PuqAaIxbhRd64
-- Original Firebase student_id: VRFaM9vRZgNrQGHO5XWv
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T13:53:52.850Z'::timestamp with time zone);

-- Original Firebase invoice_id: r3pZBMsqxtposlIXcC4C
-- Original Firebase student_id: z3Em9fs7cxFrmI2VItjh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-16T14:15:02.283Z'::timestamp with time zone);

-- Original Firebase invoice_id: RQNBQk731o9qz6bYEAqM
-- Original Firebase student_id: Q5adfhVSV6SMrsggelWq
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-23T16:40:42.060Z'::timestamp with time zone);

-- Original Firebase invoice_id: DUZ81yqgeX5cyRKkrz0s
-- Original Firebase student_id: 5gxKZV3G7kbQaZEaFdmJ
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:31:14.628Z'::timestamp with time zone);

-- Original Firebase invoice_id: uStAv4SKkgJ5WtySfMLR
-- Original Firebase student_id: TYJIiSz6GYuYyxKav4FA
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-09-07T12:59:35.096Z'::timestamp with time zone);

-- Original Firebase invoice_id: 2Zts0pLe9QLY377qZSsM
-- Original Firebase student_id: NqOOBUpgfVRdVa2W6VTX
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-30T18:12:43.140Z'::timestamp with time zone);

-- Original Firebase invoice_id: sVERmf10ShR4beoSVmfY
-- Original Firebase student_id: bGieR4EAzV1XYBhRyCsK
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T13:34:00.028Z'::timestamp with time zone);

-- Original Firebase invoice_id: J8BIKtV34HUJQK6OZEtV
-- Original Firebase student_id: uOxhfCSMo6x5nDv8kUpU
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (11, 'cash', '2025-08-30T16:54:32.622Z'::timestamp with time zone);

-- Original Firebase invoice_id: LI2GGVu0pfULpRi9tiB7
-- Original Firebase student_id: jOG7fIXzF3mUklKc7bqu
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:46:31.469Z'::timestamp with time zone);

-- Original Firebase invoice_id: q5ugrhqTUtzJzZe2SLFC
-- Original Firebase student_id: m9BzmhATRzC2Vs4ErB2e
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:50:11.158Z'::timestamp with time zone);

-- Original Firebase invoice_id: 9LwgBGbQNFjzMt0EGuad
-- Original Firebase student_id: ef6bcFPlK58pWXgZK7O2
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-08-24T01:46:16.808Z'::timestamp with time zone);

-- Original Firebase invoice_id: 5FtVCmziQ6CszctG4yh9
-- Original Firebase student_id: QPhi9B0R0xisU9mf9TFT
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-09-06T14:00:37.997Z'::timestamp with time zone);

-- Original Firebase invoice_id: NFYSNHPhCEqNpvUvEwhS
-- Original Firebase student_id: OoXZzbFACPdqA86MSyqQ
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:27:56.917Z'::timestamp with time zone);

-- Original Firebase invoice_id: Dcd0JNYBUqNFVmqiXLEM
-- Original Firebase student_id: STe4X94rt08PRieGGTtA
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (160, 'zelle', '2025-08-16T13:54:48.667Z'::timestamp with time zone);

-- Original Firebase invoice_id: MGzuKp9tDXfVfW6sUqMR
-- Original Firebase student_id: LYORjaQ0jFXfAi7US0Cj
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:39:50.867Z'::timestamp with time zone);

-- Original Firebase invoice_id: LaTuWctidfdzSAuiUonk
-- Original Firebase student_id: XrQ6yIVC9M3aaR85SXiD
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T16:11:31.921Z'::timestamp with time zone);

-- Original Firebase invoice_id: gmJcWWl0DpQgP19T4Xso
-- Original Firebase student_id: GIcw7A1x6eua1XPh8tGL
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T13:54:15.840Z'::timestamp with time zone);

-- Original Firebase invoice_id: gG91cbFYZsx8GubjKmWZ
-- Original Firebase student_id: JXW2eIxLt7ySoqgg2ePB
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (230, 'zelle', '2025-08-16T16:44:56.337Z'::timestamp with time zone);

-- Original Firebase invoice_id: zfolflBu1857ps7qllz4
-- Original Firebase student_id: ckcU9GcQLYXwsMexNNyh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-23T17:13:29.043Z'::timestamp with time zone);

-- Original Firebase invoice_id: t8FPwu1r157ZFcyLShdF
-- Original Firebase student_id: UfjeabXHAkBC5sOAPuPY
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T14:04:56.584Z'::timestamp with time zone);

-- Original Firebase invoice_id: XcdQchvFoRe4FnmvYzzk
-- Original Firebase student_id: 1Eg9SLYotnCAXnX2qZZV
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:51:06.978Z'::timestamp with time zone);

-- Original Firebase invoice_id: k7Lhl8P84GAMkLdXxIPa
-- Original Firebase student_id: Y5LVFtDZykWpmyyxO6m4
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (20, 'zelle', '2025-08-16T16:45:14.421Z'::timestamp with time zone);

-- Original Firebase invoice_id: gJcokagwQtWFrSFe1Eyo
-- Original Firebase student_id: XrQ6yIVC9M3aaR85SXiD
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (8, 'zelle', '2025-09-13T16:30:54.256Z'::timestamp with time zone);

-- Original Firebase invoice_id: Iy4gDHS6TiFPOLCbQdqI
-- Original Firebase student_id: W82qx6S8pHzrYHAn0RQT
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (44, 'cash', '2025-09-13T16:49:53.481Z'::timestamp with time zone);

-- Original Firebase invoice_id: XPN0tioZAA5Kmo9H61wH
-- Original Firebase student_id: B64sAJoNkcrdNyoci4b2
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-24T01:17:01.260Z'::timestamp with time zone);

-- Original Firebase invoice_id: TBzh9j47fGntjIDJgJ5b
-- Original Firebase student_id: 0okB4ACOsyjkAqJBVUvk
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-08-30T13:34:13.150Z'::timestamp with time zone);

-- Original Firebase invoice_id: VyiUvYC4OHR1BvgfVy9L
-- Original Firebase student_id: uOxhfCSMo6x5nDv8kUpU
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T16:11:52.937Z'::timestamp with time zone);

-- Original Firebase invoice_id: QDE46Zl4gRFsXHYHQdDy
-- Original Firebase student_id: uIlO3wT2gPrnMM82ZJKg
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-23T17:06:24.338Z'::timestamp with time zone);

-- Original Firebase invoice_id: HldXrLzrFA7DjgQq7eBF
-- Original Firebase student_id: aeEGP9Fy5j5O4vnLqsXG
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T14:09:29.680Z'::timestamp with time zone);

-- Original Firebase invoice_id: pD6Bcdr3z9zyScdwvCba
-- Original Firebase student_id: yJR9UD2ZaCLVTrkDX9ta
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-23T17:26:21.113Z'::timestamp with time zone);

-- Original Firebase invoice_id: e1Uod0oCWalYq1x4XcyQ
-- Original Firebase student_id: t4u0mkEfjTmrM40Olcmd
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-08-23T17:15:24.639Z'::timestamp with time zone);

-- Original Firebase invoice_id: vbhG9p5N2X4T8F568q4F
-- Original Firebase student_id: O6EBmoLButunFIHLV9zN
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'cash', '2025-08-16T13:19:17.124Z'::timestamp with time zone);

-- Original Firebase invoice_id: nSyRatQhbIwQ5UMjtMin
-- Original Firebase student_id: DQhaqMwJZ1WzCJ8ccnxv
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T13:40:37.816Z'::timestamp with time zone);

-- Original Firebase invoice_id: Z8mgEXEGZzOKefrAiSGk
-- Original Firebase student_id: cZFQDbZ2AkCxEbfbmLk9
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T17:15:49.286Z'::timestamp with time zone);

-- Original Firebase invoice_id: cp8CeBgKfiiDOmVhbJJW
-- Original Firebase student_id: 5gxKZV3G7kbQaZEaFdmJ
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T13:42:04.594Z'::timestamp with time zone);

-- Original Firebase invoice_id: EEis6tiqQc9fyAFTGWUb
-- Original Firebase student_id: DMQrSDAeumcPjiHZmuBW
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-16T14:03:10.098Z'::timestamp with time zone);

-- Original Firebase invoice_id: 1hWrEigKFHXZwaykvDcg
-- Original Firebase student_id: B98IoYc22v4n9TWDxHDy
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-23T13:50:43.927Z'::timestamp with time zone);

-- Original Firebase invoice_id: 6P6fBhwM6hfgis5lQbmh
-- Original Firebase student_id: vJMkFxOAY1eshv9NEQ5E
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'cash', '2025-08-30T16:40:17.017Z'::timestamp with time zone);

-- Original Firebase invoice_id: 2QlQkVwrvnnaYNfV81Sr
-- Original Firebase student_id: D752xPveJpvQ7LwS4ltv
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-16T16:12:09.819Z'::timestamp with time zone);

-- Original Firebase invoice_id: qK1MJzFK8xSUAv9AKRM3
-- Original Firebase student_id: Nm252oBpkiu5hRmhfrG1
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:50:55.104Z'::timestamp with time zone);

-- Original Firebase invoice_id: 4KU8jXtqDGGPch7UTQiZ
-- Original Firebase student_id: ML3Qmv15anbwGz53iOGh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-11-15T17:54:48.886Z'::timestamp with time zone);

-- Original Firebase invoice_id: 9UxcJYTHXqb1p46Bh6cH
-- Original Firebase student_id: ML3Qmv15anbwGz53iOGh
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (150, 'zelle', '2025-11-15T17:54:48.794Z'::timestamp with time zone);

-- Original Firebase invoice_id: PtXnUgl9zyqcw36hYdGS
-- Original Firebase student_id: hgSaMrYxz5Jo29Fg1X6u
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (40, 'zelle', '2025-08-16T14:54:32.454Z'::timestamp with time zone);

-- Original Firebase invoice_id: yD02XXE1d57Pz80XNBaB
-- Original Firebase student_id: u8nlklZ6mbJdN1wp7pBI
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-08-23T17:20:22.229Z'::timestamp with time zone);

-- Original Firebase invoice_id: Y1Q5i5ELTmB3g9udEV0m
-- Original Firebase student_id: Q5adfhVSV6SMrsggelWq
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (84, 'cash', '2025-08-16T13:24:00.704Z'::timestamp with time zone);

-- Original Firebase invoice_id: 1E7tKXb1Q7izVTGULPSX
-- Original Firebase student_id: FCIbwvWc8HPydPYepWBr
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (120, 'zelle', '2025-08-16T13:53:31.166Z'::timestamp with time zone);

-- Original Firebase invoice_id: LvOyhbVb0kV9ibkQePL3
-- Original Firebase student_id: 0okB4ACOsyjkAqJBVUvk
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (190, 'zelle', '2025-08-16T13:57:19.659Z'::timestamp with time zone);

-- Original Firebase invoice_id: FhYhC8rGvNAyUnYk79vW
-- Original Firebase student_id: TYJIiSz6GYuYyxKav4FA
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-09-13T16:42:31.613Z'::timestamp with time zone);

-- Original Firebase invoice_id: I6lWVvLdJBHrtf2r484A
-- Original Firebase student_id: Qq6rndQN0lYgZG1HX4Co
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (120, 'zelle', '2025-08-16T13:53:10.575Z'::timestamp with time zone);

-- Original Firebase invoice_id: djFuLVt5pUKWifbW6wBw
-- Original Firebase student_id: 0okB4ACOsyjkAqJBVUvk
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (4, 'zelle', '2025-08-24T02:05:00.809Z'::timestamp with time zone);

-- Original Firebase invoice_id: FTHCbra5IfUbP0AogP60
-- Original Firebase student_id: s1r39eJN6MdBEI1bT9rz
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:28:21.756Z'::timestamp with time zone);

-- Original Firebase invoice_id: ntEN3FyoGudXsBjk8PpS
-- Original Firebase student_id: TDPfWeQd8cgDn6W3642R
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (50, 'cash', '2025-08-23T13:27:48.446Z'::timestamp with time zone);

-- Original Firebase invoice_id: dcrhx32q8nRS9hmJJv3S
-- Original Firebase student_id: m9BzmhATRzC2Vs4ErB2e
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (0, 'cash', '2025-08-19T03:17:23.317Z'::timestamp with time zone);

-- Original Firebase invoice_id: hJhjbGi6NdsopSnkFAJh
-- Original Firebase student_id: aeEGP9Fy5j5O4vnLqsXG
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (44, 'cash', '2025-08-30T13:40:54.761Z'::timestamp with time zone);

-- Original Firebase invoice_id: k7Lhl8P84GAMkLdXxIPa
-- Original Firebase student_id: Y5LVFtDZykWpmyyxO6m4
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (100, 'cash', '2025-08-16T14:45:19.695Z'::timestamp with time zone);

-- Original Firebase invoice_id: Pyvzg2zr2ovIw6df5vD7
-- Original Firebase student_id: u8nlklZ6mbJdN1wp7pBI
INSERT INTO public.academy_payments (amount, method, created_at)
VALUES (80, 'zelle', '2025-08-23T17:20:06.460Z'::timestamp with time zone);



-- ============================================
-- Import Fall Academy 2025 Registrations from Firebase
-- ============================================

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Leia', 'Salazar', '(407) 474-4407', 'rcaban@hotmail.com', 'Sanford', 'Florida', '2009-05-08'::date, 'Female', 'rcaban@hotmail.com', '9113 Cardinal Cove Cir', '32771', 16, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-13T23:08:42.253Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Judy', 'Julien', '(407) 234-4051', 'judyjulien@gmail.com', 'Apopka', 'Florida', '1985-06-23'::date, 'Female', 'judyjulien@gmail.com', '1248 Countrymen Ct', '32703', 40, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-14T00:57:31.037Z'::timestamp with time zone, '2025-08-16T13:55:59.941Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Doyle', 'Blake', '(407) 444-8262', 'doyle@sleeptidhtk-9.com', 'orange', 'Florida', '2025-08-04'::date, 'Male', 'doyle@sleeptidhtk-9.com', '175 williams ave. ', '32763', 0, '{"academy":"Senior","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-30T18:06:57.805Z'::timestamp with time zone, '2025-09-06T14:13:37.541Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Joseph', 'Choi', '(689) 777-2118', 'choi.joseph421@gmail.com', 'Sanford', 'Florida', '2011-07-13'::date, 'Male', 'choi.joseph421@gmail.com', '301 South Oak Avenue', '32771', 14, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-08T22:29:44.527Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Saniya', 'Berry', '(407) 875-9423', 'sberry5x@icloud.con', 'Sanford', 'Florida', '2007-08-09'::date, 'Female', 'sberry5x@icloud.con', '210 magnolia park trail', '32773', 18, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '{"academy":"Piano","level":"N/A"}'::jsonb, '2025-08-16T16:05:00.352Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Yohanna ', 'Ramírez ', '(321) 380-5736', 'andearamirezu@gmail.com', 'Lake Mary ', 'Florida', '1984-08-05'::date, 'Female', 'andearamirezu@gmail.com', '894 e charing cross circle ', '32746', 41, '{"level":"N/A","academy":"Stretch and Strengthen"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-11T23:48:57.117Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Krish', 'Gowda ', '(321) 380-4321', 'mgowdausa@gmail.com', 'Winter Springs', 'Florida', '2017-02-11'::date, 'Male', 'mgowdausa@gmail.com', '1450 Creekside Circle', '32708', 8, '{"level":"N/A","academy":"Soccer"}'::jsonb, '{"level":"N/A","academy":"Piano"}'::jsonb, '2025-07-16T22:57:43.889Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jordan', 'Moser', '(407) 874-0001', 'jordan.m.moser@gmail.com', 'Lake Mary', 'Florida', '2001-02-19'::date, 'Female', 'jordan.m.moser@gmail.com', '700 CREEKWATER TER APT 210', '32746', 24, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '2025-11-08T21:20:03.732Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Aaradana ', 'Gowda', '(321) 380-4321', 'mgowdausa@gmail.com', 'Winter Springs', 'Florida', '2014-06-18'::date, 'Female', 'mgowdausa@gmail.com', '1450 Creekside Circle', '32708', 11, '{"level":"N/A","academy":"Art"}'::jsonb, '{"level":"N/A","academy":"Piano"}'::jsonb, '2025-07-16T22:59:14.492Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jahaira', 'Edwards', '(386) 589-2280', 'pokahontis21@gmail.com', 'DeLand', 'Florida', '1983-11-24'::date, 'Female', 'pokahontis21@gmail.com', '1486 Chelsea Manor Cir', '32724', 41, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-11-11T13:33:09.853Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Amber', 'Cartieri', '(407) 952-9545', 'linklak1@gmail.com', 'Sanford', 'Florida', '1987-08-30'::date, 'Female', 'linklak1@gmail.com', '120 Casa Marina Place', '32771', 37, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '2025-05-10T17:28:17.261Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Menorah', 'Lerhtoo', '(919) 638-6928', 'kukupoe7@gmail.com', 'Deland', 'Florida', '2010-12-06'::date, 'Female', 'kukupoe7@gmail.com', '1240 Bear oak Ln', '32720', 14, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"DIY"}'::jsonb, '2025-08-12T01:58:10.749Z'::timestamp with time zone, '2025-08-16T13:30:42.881Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jen', 'Ulmer', '(407) 353-1137', 'rogueitalian@gmail.com', 'Sanford', 'Florida', '1988-03-09'::date, 'Female', 'rogueitalian@gmail.com', '101 Little Fox Ave', '32773', 37, '{"level":"K-Movie Conversation","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-16T02:39:49.554Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jeyliah ', 'Cifredo ', '(863) 279-7969', 'cifredoj@yahoo.com', 'Lakeland', 'Florida', '2006-04-17'::date, 'Female', 'cifredoj@yahoo.com', 'PO BOX 92732', '33804', 19, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-09-06T13:55:44.515Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Tony', 'Montoya', '(407) 580-3690', 'Mibmaster6@gmail.com', 'Orlando', 'Florida', '2010-02-02'::date, 'Male', 'Mibmaster6@gmail.com', '519 carr st orlando Fl 32807', '32807', 15, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"level":"No","academy":"No Academy"}'::jsonb, '2025-07-03T14:31:15.593Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('AnneMarie', 'Sargent', '(407) 902-9424', 'amsargent407@gmail.com', 'Oviedo', 'Florida', '1959-03-20'::date, 'Female', 'amsargent407@gmail.com', '516 Lake Charm Ct', '32765', 66, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '2025-06-04T16:59:30.112Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Poe', 'Phyu ', '(407) 868-2613', 'zenyoi80@gmail.com', 'Sanford', 'Florida', '2010-08-05'::date, 'Female', 'zenyoi80@gmail.com', '2527 poinsetta ave ', '32773', 15, '{"level":"N/A","academy":"DIY"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-15T20:10:28.742Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Judy', 'Yett', '(407) 416-6257', 'kitkat1073@hotmail.com', 'sanford', 'Florida', '1952-12-18'::date, 'Female', 'kitkat1073@hotmail.com', '505 ross street sanford ', '32773', 72, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-23T13:35:57.377Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jeanine', 'Alcime', '(407) 595-8634', 'jeaninejlouis@gmail.com', 'Winter Garden', 'Florida', '1982-01-03'::date, 'Female', 'jeaninejlouis@gmail.com', '613 Courtlea Cove Ave', '34787', 43, '{"level":"N/A","academy":"Stretch and Strengthen"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-12T01:07:40.344Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Sasirekha', 'Chittibabu', '(689) 209-7035', 'sivasasi2021@gmail.com', 'Sanford', 'Florida', '1987-05-21'::date, 'Female', 'sivasasi2021@gmail.com', '1124 Chase Austin way', '32771', 38, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Art"}'::jsonb, '2025-08-09T21:38:15.442Z'::timestamp with time zone, '2025-08-16T16:09:36.401Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Beverly', 'Mulligan', '(407) 341-4473', 'ballet951@hotmail.com', 'Longwood', 'Florida', '2025-08-15'::date, 'Female', 'ballet951@hotmail.com', '107 East Cumberland circle ', '32778', 0, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-15T21:20:08.230Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Chaw ', 'Khaing', '(407) 416-6177', 'mudu92@yahoo.com', 'Osteen', 'Florida', '1992-02-10'::date, 'Female', 'mudu92@yahoo.com', '1023 Peach Creek Dr', '32764', 33, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-03T17:36:20.286Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Varonda', 'Collins', '(321) 978-3714', 'varondacollins006@gmail.com', 'Altamonte Springs', 'Florida', '2006-03-20'::date, 'Female', 'varondacollins006@gmail.com', '292 Wymore Rd', '32714', 19, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '2025-10-20T18:40:16.481Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Debbie', 'Soto', '(386) 405-0544', 'debshops17@gmail.com', 'Deltona', 'Florida', '1975-07-01'::date, 'Female', 'debshops17@gmail.com', '2092 E. Prairie Cir.', '32725', 50, '{"level":"N/A","academy":"Stretch and Strengthen"}'::jsonb, '{"academy":"DIY","level":"N/A"}'::jsonb, '2025-10-01T02:12:06.346Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Stephen ', 'Rodriguez', '(415) 601-5224', 'americamriveran@gmail.com', 'Sanford', 'Florida', '2019-10-15'::date, 'Male', 'americamriveran@gmail.com', '2656 River Landing Dr', '32771', 5, '{"academy":"Art","level":"N/A"}'::jsonb, '{"academy":"Kids","level":"N/A"}'::jsonb, '2025-05-10T16:22:27.982Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Fiona', 'Lwe', '(386) 748-5799', 'myomyo777@yahoo.com', 'Deland', 'Florida', '2017-05-19'::date, 'Female', 'myomyo777@yahoo.com', '708 cinnamon fern lane', '32720', 8, '{"level":"N/A","academy":"Art"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-08-16T13:48:29.180Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Myo', 'Lwe', '(386) 748-5799', 'myomyo777@yahoo.com', 'Deland', 'Florida', '1981-02-05'::date, 'Female', 'myomyo777@yahoo.com', '708 cinnamon fern lane', '32720', 44, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-08-16T13:44:14.526Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Maria', 'Sabines', '(407) 493-7914', 'isabelsabines@gmail.com', 'Orlando', 'Florida', '1997-06-08'::date, 'Female', 'isabelsabines@gmail.com', '5117 Barton Dr', '32807', 28, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '2025-08-06T02:15:54.813Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Amanda', 'Nelson', '(407) 415-4706', 'carolbee42@gmail.com', 'Sanford', 'Florida', '2016-12-01'::date, 'Female', 'carolbee42@gmail.com', '124 Fairway Drive', '32771', 8, '{"level":"N/A","academy":"Art"}'::jsonb, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '2025-07-18T00:10:13.417Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Echo', 'Tantillo', '(772) 872-2996', 'echort23@gmail.com', 'Orlando', 'Florida', '2000-04-23'::date, 'Female', 'echort23@gmail.com', '6173 Raleigh Street', '32835', 25, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-06-21T03:28:04.467Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Isabella', 'Chrisphonte', '(904) 440-4052', 'isabellachrisphonte@gmail.com', 'Kissimmee', 'Florida', '2002-03-24'::date, 'Female', 'isabellachrisphonte@gmail.com', '1607 Cross Prairie Parkway', '34744', 23, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '2025-06-17T22:02:12.958Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Carolina', 'García', '(407) 860-3115', 'satarah1@gmail.com', 'Apopka', 'Florida', '1979-01-22'::date, 'Female', 'satarah1@gmail.com', '1456 Crawford dr', '32703', 46, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-03T03:36:03.486Z'::timestamp with time zone, '2025-08-16T14:33:46.739Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Elana', 'Wartell', '(407) 461-6098', 'treeroot1111@yahoo.com', 'Altamonte Springs', 'Florida', '1976-10-17'::date, 'Female', 'treeroot1111@yahoo.com', '932 Poplar Dr', '32714', 48, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-07-24T18:57:23.063Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Pablo', 'Menendez', '(786) 482-3646', 'pablomenendez27@gmail.com', 'Oviedo', 'Florida', '1996-10-10'::date, 'Male', 'pablomenendez27@gmail.com', '4272 Spoleto Cir Apt 102', '32765', 28, '{"academy":"Piano","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-07-15T13:41:23.120Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Jack', 'Say', '(407) 416-6177', 'mudu92@yahoo.com', 'Osteen', 'Florida', '2018-11-20'::date, 'Male', 'mudu92@yahoo.com', '1023 peach creek dr', '32764', 6, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"academy":"Kids","level":"N/A"}'::jsonb, '2025-08-16T13:38:35.822Z'::timestamp with time zone, '2025-08-16T13:39:26.229Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Norah', 'Amado Santana', '(407) 923-1287', 'guirufita@hotmail.com', 'Davenport', 'Florida', '2012-06-24'::date, 'Female', 'guirufita@hotmail.com', '319 Walpole Loop', '33897', 13, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-11T17:12:19.925Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Courage', 'Dei-Zanga', '(024) 313-2410', 'cficenter2007@yahoo.com', 'Ho', 'Florida', '1975-05-23'::date, 'Male', 'cficenter2007@yahoo.com', 'Taiwia street', '00233', 50, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '2025-07-23T11:19:09.784Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Daniel', 'Choi', '(321) 370-0476', 'danielchoi0423@gmail.com', 'Sanford', 'Florida', '2008-04-23'::date, 'Male', 'danielchoi0423@gmail.com', '301 South oak ave', '32771', 17, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-08T21:53:48.685Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Soon', 'Blake', '(407) 448-2623', 'doyle@sleeptightk-9.com', 'orange', 'Florida', '2025-08-30'::date, 'Female', 'doyle@sleeptightk-9.com', '175 williams Av. ', '32763', 0, '{"level":"N/A","academy":"Senior"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-30T18:11:38.638Z'::timestamp with time zone, '2025-09-06T14:13:29.308Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jeremiah ', 'Youngblood ', '(850) 728-1885', 'jeremomochi9@gmail.com', 'Tallahassee ', 'Florida', '1996-03-17'::date, 'Male', 'jeremomochi9@gmail.com', '12 Belmont Court', '32327', 29, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '2025-07-17T14:38:49.792Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('America', 'Navarro', '(407) 227-9910', 'americanavarro05@gmail.com', 'Winter Springs', 'Florida', '1959-10-12'::date, 'Female', 'americanavarro05@gmail.com', '849 Dunbar dr ', '32708', 65, '{"level":"N/A","academy":"Senior"}'::jsonb, '{"academy":"No Academy","level":"N/A"}'::jsonb, '2025-06-14T11:09:23.444Z'::timestamp with time zone, '2025-08-16T13:13:43.991Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Alexander', 'Lerhtoo', '(919) 638-6928', 'kukupoe7@gmail.com', 'Deland', 'Florida', '2020-04-01'::date, 'Male', 'kukupoe7@gmail.com', '1240 Bear Oak Ln', '32720', 5, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"level":"N/A","academy":"Kids"}'::jsonb, '2025-08-12T02:01:52.601Z'::timestamp with time zone, '2025-08-16T13:27:28.767Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Michelle', 'Pizarro Brenes', '(407) 702-8774', 'michellebrenes61@gmail.com', 'Orlando', 'Florida', '1993-10-12'::date, 'Female', 'michellebrenes61@gmail.com', '530 north summerlin ave', '32803', 31, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"academy":"Piano","level":"N/A"}'::jsonb, '2025-09-22T03:27:11.979Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Catherine', 'Hamilton', '(386) 589-3367', 'catherinehamilton316@gmail.com', 'Deltona', 'Florida', '1978-09-22'::date, 'Female', 'catherinehamilton316@gmail.com', '525 Cavalier Avenue', '32725', 47, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-11-09T21:20:03.464Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Aurelia', 'Spade', '(407) 790-5817', 'jspade668@yahoo.com', 'Sanford', 'Florida', '2013-08-13'::date, 'Female', 'jspade668@yahoo.com', '130 Fairway Dr', '32771', 11, '{"level":"N/A","academy":"Art"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-10T21:51:47.518Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Danuta', 'TRUSZKOWKI', '(321) 432-2958', 'DIANEMYAGENT@GMAIL.COM', 'MELBOURNE', 'Florida', '1964-10-08'::date, 'Female', 'DIANEMYAGENT@GMAIL.COM', '2660 REVOLUTION ST. #103', '32935', 60, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-09-06T14:00:16.875Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Liam', 'Lwe', '(386) 748-5799', 'myomyo777@yahoo.com', 'Deland', 'Florida', '2015-04-03'::date, 'Male', 'myomyo777@yahoo.com', '708 cinnamon fern lane', '32720', 10, '{"academy":"Art","level":"N/A"}'::jsonb, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '2025-08-16T13:47:25.628Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Stephanie', 'Croney', '(407) 212-6275', 'stephanieacroney@yahoo.com', 'DeLand', 'Florida', '1993-12-01'::date, 'Female', 'stephanieacroney@yahoo.com', '744 Mockingbird Lane', '32720', 31, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-10-19T03:06:11.739Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Sefora ', 'Acevedo', '(760) 716-7013', 'sefiekix94@gmail.com', 'Orlando', 'Florida', '1994-05-13'::date, 'Female', 'sefiekix94@gmail.com', '3213 N tanner Road ', '32826', 31, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-12T13:20:23.552Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Isabel ', 'Musrri ', '(321) 380-5736', 'andearamirezu@gmail.com', 'Lake Mary ', 'Florida', '2015-11-11'::date, 'Female', 'andearamirezu@gmail.com', '894 e charing cross circle ', '32746', 9, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-11T23:57:49.023Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Antonia ', 'Musrri ', '(321) 380-5736', 'andearamirezu@gmail.com', 'Lake Mary ', 'Florida', '2012-12-12'::date, 'Female', 'andearamirezu@gmail.com', '894 e charing cross circle ', '32746', 12, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-11T23:53:31.314Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jefferson', 'Aung', '(386) 748-5799', 'myomyo777@yahoo.com', 'Deland', 'Florida', '2013-07-31'::date, 'Male', 'myomyo777@yahoo.com', '507 elkhorn fern lane', '32720', 12, '{"level":"N/A","academy":"DIY"}'::jsonb, '{"level":"N/A","academy":"Piano"}'::jsonb, '2025-08-16T13:50:25.721Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Joel', 'Phyu', '(407) 393-8462', 'zenyoi80@gmail.com', 'Sanford', 'Florida', '2018-12-23'::date, 'Male', 'zenyoi80@gmail.com', '2527 poinsetta ave', '32773', 6, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Kids"}'::jsonb, '2025-08-15T23:18:39.713Z'::timestamp with time zone, '2025-08-23T17:28:02.556Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Nicole', 'Weaver', '(813) 763-5084', 'lagamorphranch@gmail.com', 'Plant City', 'Florida', '1971-07-15'::date, 'Female', 'lagamorphranch@gmail.com', '975 McGee Rd', '33565', 54, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-05T03:41:25.510Z'::timestamp with time zone, '2025-08-16T16:39:32.891Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Jason', 'Mobley', '(561) 670-9103', 'xisilmarx@yahoo.com', 'Sanford', 'Florida', '1987-07-23'::date, 'Male', 'xisilmarx@yahoo.com', '1012 W 3rd st', '32771', 38, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-23T14:12:16.510Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Ibnul', 'Alam', '(386) 843-8210', 'ibnulalam25@gmail.com', 'Daytona Beach', 'Florida', '1996-02-21'::date, 'Male', 'ibnulalam25@gmail.com', '1479 Shady Pl', '32114', 29, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-11-10T16:18:56.012Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Belinda', 'Wilcox', '(321) 663-7832', 'jamredzz@yahoo.com', 'Sanford ', 'Florida', '1972-05-31'::date, 'Female', 'jamredzz@yahoo.com', '527 Old England Loop ', '32771', 53, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-18T14:33:26.674Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Isabella', 'Salazar', '(407) 474-4407', 'rcaban@hotmail.com', 'Sanford', 'Florida', '2007-08-29'::date, 'Female', 'rcaban@hotmail.com', '9113 Cardinal Cove Cir', '32771', 17, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-13T23:06:22.451Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Esiah ', 'Cifredo', '(941) 877-4905', 'cifredoj@yahoo.com', 'Lakeland', 'Florida', '2011-06-10'::date, 'Male', 'cifredoj@yahoo.com', 'PO BOX 92732', '33805', 14, '{"academy":"Pickleball","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-10T22:53:10.855Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Johannah', 'Lwe', '(386) 748-5799', 'myomyo777@yahoo.com', 'Deland', 'Florida', '2009-09-05'::date, 'Female', 'myomyo777@yahoo.com', '708 cinnamon fern lane', '32720', 15, '{"level":"N/A","academy":"Stretch and Strengthen"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-08-16T13:45:49.881Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Manjesh ', 'Gowda ', '(321) 380-4321', 'mgowdausa@gmail.com', 'Winter Springs', 'Florida', '1980-08-25'::date, 'Male', 'mgowdausa@gmail.com', '1450 Creekside Circle', '32708', 44, '{"academy":"Art","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Art"}'::jsonb, '2025-07-16T23:04:42.400Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Flo', 'Park', '(321) 577-1884', 'florancepark@gmail.com', 'Orlando', 'Florida', '1994-07-01'::date, 'Female', 'florancepark@gmail.com', '3379 Coe Ave', '32806', 31, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-08-13T22:35:40.570Z'::timestamp with time zone, '2025-09-13T16:46:51.912Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('BellaLeigh ', 'Mathurin ', '(863) 332-2808', 'esvasquez90@gmail.com', 'Lakeland ', 'Florida', '2014-02-12'::date, 'Female', 'esvasquez90@gmail.com', '5085 Asbury Parke Dr. ', '33805', 11, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-10-03T23:48:07.549Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Sivaraman (Shanvith)', 'Thulasi', '(689) 209-7035', 'sivasasi2021@gmail.com', 'Sanford', 'Florida', '1986-08-20'::date, 'Male', 'sivasasi2021@gmail.com', '1124 Chase Austin way', '32771', 38, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"academy":"Piano","level":"N/A"}'::jsonb, '2025-08-09T21:36:35.494Z'::timestamp with time zone, '2025-08-16T16:10:52.337Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Matthew', 'Garcia', '(407) 961-3384', 'n@a', 'Orlando', 'Florida', '2000-04-02'::date, 'Male', 'n@a', '2448 cadillac avenue', '32818', 25, '{"level":"N/A","academy":"Art"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-16T14:38:44.953Z'::timestamp with time zone, '2025-08-16T17:01:45.040Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Bob', 'Beck', '(386) 279-8718', 'bob.beck@charter.net', 'Orange City', 'Florida', '1957-12-29'::date, 'Male', 'bob.beck@charter.net', '765 GRAND PLAZA DRIVE', '32763', 67, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-11T23:33:05.745Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Magali', 'Rodriguez', '(386) 490-3835', 'mageerg10@gmail.com', 'De Leon Spgs', 'Florida', '1991-07-16'::date, 'Female', 'mageerg10@gmail.com', '195 Springs st', '32130', 34, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-10T00:05:54.806Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Charlie', 'Merrick', '(407) 430-8410', 'yennabel@yahoo.com', 'Lake Mary', 'Florida', '2014-09-02'::date, 'Male', 'yennabel@yahoo.com', '406 Cinnamon Oak Ct', '32746', 10, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-05T03:33:39.382Z'::timestamp with time zone, '2025-08-24T01:51:14.437Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Kyle', 'Midgley', '(321) 663-7832', 'jamredzz@yahoo.com', 'Sanford', 'Florida', '2012-02-22'::date, 'Male', 'jamredzz@yahoo.com', '527 Old England Loop ', '32771', 13, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-12T00:11:35.053Z'::timestamp with time zone, '2025-08-16T14:08:55.689Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Azalee', 'Nelson', '(270) 363-7181', 'azale.nelson@gmail.com', 'Orlando', 'Florida', '2003-10-03'::date, 'Female', 'azale.nelson@gmail.com', '505 Chatham Avenue', '32801', 21, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-13T01:46:29.079Z'::timestamp with time zone, '2025-08-16T13:09:47.794Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Elias', 'Cifredo', '(941) 877-4905', 'cifredoj@yahoo.com', 'Lakeland', 'Florida', '2012-12-10'::date, 'Male', 'cifredoj@yahoo.com', 'PO BOX 92732', '33805', 12, '{"academy":"DIY","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Art"}'::jsonb, '2025-08-10T22:55:10.872Z'::timestamp with time zone, '2025-08-16T17:16:14.128Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('URSULA ', 'TERRY', '(813) 816-3259', 'N@A', 'TAMPA', 'Florida', '1987-01-09'::date, 'Female', 'N@A', '10200 N Armenia Ave.  Apt 2104 ', '33614', 38, '{"level":"N/A","academy":"Stretch and Strengthen"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-23T14:55:17.263Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Carol', 'Beyner', '(407) 415-4706', 'carolbee42@gmail.com', 'Sanford', 'Florida', '1966-08-02'::date, 'Female', 'carolbee42@gmail.com', '124 Fairway Drive', '32771', 58, '{"academy":"Art","level":"N/A"}'::jsonb, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '2025-07-14T16:49:47.176Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Aaron', 'Acevedo', '(321) 369-8755', 'jonnacevedo1@gmail.com', 'Orlando', 'Florida', '2013-12-25'::date, 'Male', 'jonnacevedo1@gmail.com', '3213 North Tanner Rd', '32826', 11, '{"level":"N/A","academy":"Art"}'::jsonb, '{"academy":"DIY","level":"N/A"}'::jsonb, '2025-08-11T02:41:17.040Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Aimi', 'Chirino', '(813) 816-3259', 'n@a', 'tampa', 'Florida', '2013-05-10'::date, 'Female', 'n@a', '10200 N Armenia Ave.  Apt 2104', '33614', 12, '{"academy":"Piano","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-23T14:46:50.836Z'::timestamp with time zone, '2025-08-23T17:09:55.115Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Britney', 'Lopez', '(407) 717-9214', 'britney.orpm@gmail.com', 'Davenport', 'Florida', '1996-02-09'::date, 'Female', 'britney.orpm@gmail.com', '5243 Dagenham Dr', '33837', 29, '{"academy":"Art","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-11-09T19:49:08.680Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Xiaoyan', 'Huang', '(714) 457-3677', 'xiaoyanhuang10@gmail.com', 'Orlando', 'Florida', '1962-10-10'::date, 'Female', 'xiaoyanhuang10@gmail.com', '4687 Posada Dr', '32839', 62, '{"level":"N/A","academy":"Senior"}'::jsonb, '{"level":"N/A","academy":"Senior"}'::jsonb, '2025-08-13T20:01:38.883Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Getsi', 'Abonce', '(561) 507-7915', 'getsi01@hotmail.com', 'orlando', 'Florida', '1999-02-04'::date, 'Female', 'getsi01@hotmail.com', '6480 Ranelagh Dr', '32835', 26, '{"academy":"Art","level":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-13T19:53:39.057Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Robert ', 'Snow', '(574) 377-3192', 'robert.snow85@gmail.com', 'Sanford ', 'Florida', '1985-01-08'::date, 'Male', 'robert.snow85@gmail.com', '1306 Hillwood Dr', '32771', 40, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-11-09T23:07:10.037Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Susan', 'Vales', '(352) 936-9397', 'mooselady1320@yahoo.com', 'Leesburg', 'Florida', '1959-10-03'::date, 'Female', 'mooselady1320@yahoo.com', '302 Sandy Oak Circle Apt 303', '34748', 65, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"academy":"Art","level":"N/A"}'::jsonb, '2025-06-10T21:36:28.415Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Martha', 'De La Fuente', '(305) 794-2923', 'martica.fuente03@gmail.com', 'Winter Springs', 'Florida', '1995-05-03'::date, 'Female', 'martica.fuente03@gmail.com', '332 Courtney Springs Circle', '32708', 30, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-11T23:21:20.138Z'::timestamp with time zone, '2025-08-16T16:37:08.463Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Zaimarie', 'Pitre', '(407) 437-7320', 'zaimarie_salas@hotmail.com', 'Sanford', 'Florida', '1994-06-24'::date, 'Female', 'zaimarie_salas@hotmail.com', '5260 Windsor Lake Circle', '32773', 31, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-16T02:41:37.838Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Emily ', 'Cifredo', '(610) 451-3161', 'ecifredo@yahoo.com', 'Lakeland', 'Florida', '1984-10-01'::date, 'Female', 'ecifredo@yahoo.com', 'PO BOX ', '33805', 40, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-10T17:45:24.805Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Angel', 'Kim', '(321) 223-4593', 'angeljookim@gmail.com', 'Cocoa', 'Florida', '1996-06-26'::date, 'Female', 'angeljookim@gmail.com', '5929 Rena Ave', '32927', 29, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-11T23:56:43.552Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Mariglorie', 'Berrocal', '(321) 331-2383', 'joy.berrocal@gmail.com', 'Altamonte Springs', 'Florida', '1967-10-14'::date, 'Female', 'joy.berrocal@gmail.com', '661 Colgate Drive', '32714', 57, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-16T21:09:34.792Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Michelle', 'Rice', '(407) 797-4625', 'rome3333@gmail.com', 'Longwood', 'Florida', '1977-01-13'::date, 'Female', 'rome3333@gmail.com', '703 Fox Valley ', '32779', 48, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-07-29T15:14:20.529Z'::timestamp with time zone, '2025-08-16T13:46:00.816Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Amyra', 'Verma', '(689) 258-1829', 'abhi_649@hotmail.com', 'Ocoee', 'Florida', '2015-09-08'::date, 'Female', 'abhi_649@hotmail.com', '1241 vizcaya lake rd', '34761', 9, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '2025-06-15T15:36:52.073Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Riley', 'Fleming', '(321) 356-1680', 'rileyfleming17@gmail.com', 'Lake Mary', 'Florida', '2002-06-17'::date, 'Female', 'rileyfleming17@gmail.com', '700 Creekwater Terrace, 210', '32746', 23, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-11-08T21:20:03.401Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Lina', 'Caro', '(407) 412-1517', 'linamariacaro@aol.com', 'Oviedo', 'Florida', '1997-10-20'::date, 'Female', 'linamariacaro@aol.com', '2813 Joseph Cir ', '32765', 27, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '2025-07-11T03:22:02.175Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Noah', 'Louis Morales', '(656) 200-7031', 'ing.jod@gmail.com', 'Tampa', 'Florida', '2020-01-19'::date, 'Male', 'ing.jod@gmail.com', '3550 Tobago LN ', '33614', 5, '{"level":"N/A","academy":"Soccer"}'::jsonb, '{"level":"N/A","academy":"Kids"}'::jsonb, '2025-08-10T11:21:32.452Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Debora ', 'Watts', '(407) 913-0400', 'ddrake1231@gmail.com', 'Orlando', 'Florida', '1951-12-31'::date, 'Female', 'ddrake1231@gmail.com', '2501 Kingsland Avenue', '32808', 73, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-12T00:59:25.521Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Lexi', 'Blakey', '(702) 715-1066', 'amfangelbaby@gmail.com', 'Davenport', 'Florida', '1998-01-26'::date, 'Female', 'amfangelbaby@gmail.com', '5573 Loma Vista Loop', '33896', 27, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-11-08T20:43:00.712Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Rejina', 'St. Cyr', '(305) 834-8331', 'rpstcyr@gmail.com', 'Orlando ', 'Florida', '1981-11-03'::date, 'Female', 'rpstcyr@gmail.com', '150 Boardwalk Ave ', '32765', 43, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"academy":"Piano","level":"N/A"}'::jsonb, '2025-06-18T22:11:31.448Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Corbin ', 'Williams', '(321) 615-0053', 'corbinjw24@gmail.com', 'Cocoa', 'Florida', '1992-09-25'::date, 'Male', 'corbinjw24@gmail.com', '5929 Rena Ave', '32927', 32, '{"academy":"N/A","level":"N/A"}'::jsonb, '{"academy":"Korean Cooking","level":"N/A"}'::jsonb, '2025-08-11T23:58:35.637Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Suma', 'Ramakrishna ', '(321) 380-4321', 'mgowdausa@gmail.com', 'Winter Springs', 'Florida', '1982-02-09'::date, 'Female', 'mgowdausa@gmail.com', '1450 Creekside Circle', '32708', 43, '{"academy":"Art","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-07-16T23:00:47.470Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Arionna', 'Taylor', '(386) 232-0450', 'ataylor31@stetson.edu', 'Deland', 'Florida', '2005-11-08'::date, 'Female', 'ataylor31@stetson.edu', '105 laurel villas cir apt 505', '32624', 19, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-07-21T02:05:16.207Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Joy', 'Li', '(917) 332-7242', 'jiayingli1112@gmail.com', 'Orlando', 'Florida', '1998-11-12'::date, 'Female', 'jiayingli1112@gmail.com', '7037 Carrickbend Ln', '32819', 26, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '2025-06-24T17:39:09.020Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Marina', 'Henry', '(321) 279-2554', 'marinagirgis58@gmail.com', 'Sanford ', 'Florida', '2002-04-09'::date, 'Female', 'marinagirgis58@gmail.com', '372 carina circle ', '32773', 23, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-12T01:26:08.029Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Robert', 'Subida', '(773) 392-0382', 'robertsubida@gmail.com', 'Deltona', 'Florida', '1982-08-29'::date, 'Male', 'robertsubida@gmail.com', '2211 Clearwater Dr', '32738', 42, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-10T17:51:57.417Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Mary', 'klein', '(850) 591-2935', 'mhklein72@gmail.com', 'Lake Mary', 'Florida', '1972-09-23'::date, 'Female', 'mhklein72@gmail.com', '2290 soaring eagle pl', '32746', 52, '{"level":"Intermediate","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-08-11T22:52:37.192Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Dena', 'Gonzalez', '(407) 375-1518', 'denagonzalez12@gmail.com', 'Orlando', 'Florida', '1997-03-20'::date, 'Female', 'denagonzalez12@gmail.com', '13517 Glasser Ave', '32826', 28, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '2025-06-20T09:44:40.140Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Krista', 'Baweja', '(772) 348-9912', 'thaibaweja@gmail.com', 'Heathrow', 'Florida', '1993-07-23'::date, 'Female', 'thaibaweja@gmail.com', '716 Kenilworth cir, apt 104', '32746', 32, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-11-10T19:32:29.961Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('David', 'Choi', '(689) 230-4762', 'dchoi2210@gmail.com', 'Sanford', 'Florida', '2006-12-24'::date, 'Male', 'dchoi2210@gmail.com', '301 s oak ave', '32771', 18, '{"level":"N/A","academy":"Pickleball"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-16T13:15:57.263Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Keren', 'Vaz', '(205) 207-2095', 'kerenvaz3@gmail.com', 'Sanford ', 'Florida', '2006-04-05'::date, 'Female', 'kerenvaz3@gmail.com', '451 ligonier ct', '32771', 19, '{"academy":"Stretch and Strengthen","level":"N/A"}'::jsonb, '{"level":"Beginner","academy":"Korean Language"}'::jsonb, '2025-08-19T00:30:25.729Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Belia', 'Terry', '(813) 816-3259', 'n@a', 'Tampa', 'Florida', '2011-07-21'::date, 'Female', 'n@a', '10200 N Armenia Ave.  Apt 2104 ', '33614', 14, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-23T14:42:26.931Z'::timestamp with time zone, '2025-08-23T17:09:44.004Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Norelis', 'Chirino', '(813) 951-0715', 'noreliscarol@gmail.com', 'tampa', 'Florida', '1984-09-29'::date, 'Female', 'noreliscarol@gmail.com', '10200 n armenia av. ', '33612', 40, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-23T17:19:08.237Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Shardeh ', 'Oliver', '(407) 715-9926', 'shardeholiver@gmail.com', 'Sanford ', 'Florida', '1988-03-05'::date, 'Female', 'shardeholiver@gmail.com', '210 Magnolia park trail', '32773', 37, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"academy":"Korean Language","level":"Intermediate"}'::jsonb, '2025-08-06T00:53:11.860Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Ronith', 'Siva', '(689) 209-7035', 'sivasasi2021@gmail.com', 'Sanford', 'Florida', '2015-03-10'::date, 'Male', 'sivasasi2021@gmail.com', '1124 Chase Austin way', '32771', 10, '{"level":"N/A","academy":"N/A"}'::jsonb, '{"academy":"Art","level":"N/A"}'::jsonb, '2025-08-09T21:39:33.078Z'::timestamp with time zone, '2025-08-16T16:08:56.837Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Brother ', 'Cifredo', '(941) 877-4905', 'cifredoj@yahoo.com', 'Lakeland', 'Florida', '1984-01-10'::date, 'Male', 'cifredoj@yahoo.com', 'PO BOX 92732', '33804', 41, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"level":"N/A","academy":"N/A"}'::jsonb, '2025-08-11T00:40:51.173Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Tyler', 'Douglas', '(850) 530-6306', 'tylerdouglas2017@gmail.com', 'Pensacola', 'Florida', '2005-06-06'::date, 'Male', 'tylerdouglas2017@gmail.com', '20 East Ten Mile Rd', '32534', 20, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"level":"N/A","academy":"Piano"}'::jsonb, '2025-08-30T13:55:30.025Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Aidan', 'Clemente', '(814) 360-7199', 'aidanclemente@gmail.com', 'Orlando', 'Florida', '1984-04-22'::date, 'Female', 'aidanclemente@gmail.com', '9512 Cannon Dr', '32817', 41, '{"academy":"Korean Language","level":"Beginner"}'::jsonb, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '2025-07-19T01:41:06.720Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('MANUELA', 'A BRAN', '(407) 723-3829', 'manualejabran@gmail.com', 'Orlando', 'Florida', '2007-05-08'::date, 'Female', 'manualejabran@gmail.com', '4928 Cason Cove Drive, 101', '32811', 18, '{"academy":"Korean Language","level":"K-Movie Conversation"}'::jsonb, '{"level":"N/A","academy":"Korean Cooking"}'::jsonb, '2025-11-08T20:42:48.282Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Diane', 'Truszkowski ', '(321) 432-2958', 'dianemyagent@gmail.com', 'Melbourne ', 'Florida', '1964-10-08'::date, 'Female', 'dianemyagent@gmail.com', '2660 Revolution St #103', '32935', 60, '{"level":"Alphabet","academy":"Korean Language"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-12T01:59:26.901Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Hanna', 'Phyu', '(407) 457-4520', 'hannaphyu2012@gmail.com', 'Sanford', 'Florida', '2012-04-10'::date, 'Female', 'hannaphyu2012@gmail.com', '2527 poinsetta ave', '32773', 13, '{"level":"N/A","academy":"DIY"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-16T00:45:01.490Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at, updated_at)
VALUES ('Lucas', 'Acevedo', '(321) 369-8755', 'jonnacevedo1@gmail.com', 'Orlando', 'Florida', '2013-12-25'::date, 'Male', 'jonnacevedo1@gmail.com', '3213 North Tanner Rd', '32826', 11, '{"level":"N/A","academy":"Piano"}'::jsonb, '{"academy":"DIY","level":"N/A"}'::jsonb, '2025-08-09T19:57:32.697Z'::timestamp with time zone, '2025-08-16T17:23:50.077Z'::timestamp with time zone);

INSERT INTO public.academy_registrations (first_name, last_name, cell_number, email, city, state, birthday, gender, confirm_email, address, zip_code, age, first_period, second_period, created_at)
VALUES ('Maritza', 'Subida', '(773) 407-5388', 'maritzasubida@gmail.com', 'sanford', 'Florida', '1980-09-26'::date, 'Female', 'maritzasubida@gmail.com', '2211 clearwater drive', '33614', 44, '{"academy":"Korean Language","level":"Alphabet"}'::jsonb, '{"academy":"N/A","level":"N/A"}'::jsonb, '2025-08-10T17:52:54.039Z'::timestamp with time zone);


