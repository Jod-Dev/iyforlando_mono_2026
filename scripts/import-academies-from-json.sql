-- ============================================
-- Import Academies from JSON
-- ============================================
-- This script imports academy data from the provided JSON structure
-- Execute this in Supabase Dashboard > SQL Editor
-- ============================================

-- Insert academies from JSON data
INSERT INTO public.academies (
  name,
  title,
  description,
  price,
  level,
  age,
  schedule,
  image,
  tag,
  catch_phrase,
  goal,
  equipment,
  academy_details_img,
  link_name,
  note,
  status
) VALUES
-- Academy 1: Art
(
  'Art', -- name
  'Art', -- title
  'Unleash your creativity in a welcoming environment as you explore diverse art techniques and drawing styles. Through crafting original artwork, you will enhance critical thinking, master project completion, and bring your artistic visions to life.',
  '$80.00 per semester',
  'Level (N/A)',
  '1st grade to adult',
  '["1st Period: 10:00 am - 11:30 am", "2nd Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FArt.png?alt=media&token=74bbbef9-f747-4738-b22a-f931f79f0af3',
  'Art',
  'Unleash your inner artist!',
  '["Learn various art techniques.", "Enhance critical thinking.", "Enhance communication.", "Enhance perseverance.", "Enhance visualization.", "Enhance fine motor skills."]'::jsonb,
  'Sketchbook, pencils, paints, and brushes.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FArt.png?alt=media&token=74bbbef9-f747-4738-b22a-f931f79f0af3',
  'art',
  '[]'::jsonb,
  'active'
),
-- Academy 2: DIY
(
  'DIY', -- name
  'DIY', -- title
  'DIY (Do it Yourself) Academy is an innovative educational platform designed to empower individuals with the skills and knowledge to undertake do-it-yourself projects. Decorating and making things for yourself or for others is an enjoyable activity. Whether you''re a beginner looking to start a new hobby or a seasoned DIY enthusiast aiming to enhance your skills, DIY Academy provides the resources and support to help you succeed.',
  '$80.00 per semester',
  'Level (N/A)',
  '4th grade to adult',
  '["1st Period: 10:00 am - 11:30 am", "2nd Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FDIY.png?alt=media&token=aedf77d4-d9f6-453b-a385-cf2d0e4e2810',
  'Art',
  'Empowering you to learn and show your inner creator!',
  '["Gain hands-on experience in crafts, boost creativity, and customize projects.", "Gain satisfaction and bring joy to yourself and others.", "Improve innovative thinking and learn efficient use of materials and tools.", "Connect with a community for idea-sharing and project collaboration."]'::jsonb,
  'Craft supplies as needed per project.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FDIY.png?alt=media&token=aedf77d4-d9f6-453b-a385-cf2d0e4e2810',
  'diy',
  '[]'::jsonb,
  'active'
),
-- Academy 3: Kids
(
  'Kids', -- name
  'Kids', -- title
  'Fun and educational place where children can learn and play together. Each session is packed with exciting activities, educational games, and creative projects designed to help kids discover new things while having a great time!',
  '$40.00 per semester',
  'Level (N/A)',
  'Pre-K to 1st grade',
  '["One Time Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKids.png?alt=media&token=2d4b6d2c-7dd0-4f07-b3cc-111f89d074c4',
  'Kids',
  'Play, Learn & Discover',
  '["Learn academic subjects.", "Explore diverse interests.", "Cultivate a positive mindset.", "Build teamwork."]'::jsonb,
  'Various toys and educational materials.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKids.png?alt=media&token=2d4b6d2c-7dd0-4f07-b3cc-111f89d074c4',
  'kids',
  '[]'::jsonb,
  'active'
),
-- Academy 4: Korean Cooking
(
  'Korean Cooking', -- name
  'Korean Cooking', -- title
  'Discover the secrets of Korean cuisine in a hands-on cooking academy that goes beyond recipes, where you will master six delicious dishes in a semester.',
  '$150.00 per semester',
  'Level (N/A)',
  '7th grade to adult',
  '["One Time Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKorean_Cooking_Academy.png?alt=media&token=82ca66bb-ce3a-457c-832e-f7c8312ce755',
  'Cooking',
  'Master authentic Korean cuisine in our cooking classes.',
  '["Cooking skills.", "Recipe knowledge.", "Kitchen confidence."]'::jsonb,
  'Apron, chef''s knife, and basic cooking utensils.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKorean_Cooking_Academy.png?alt=media&token=82ca66bb-ce3a-457c-832e-f7c8312ce755',
  'koreancooking',
  '[]'::jsonb,
  'active'
),
-- Academy 5: Korean Language
(
  'Korean Language', -- name
  'Korean Language', -- title
  'Korean Academy offers immersive language courses led by experienced instructors, focusing on proficiency through interactive learning and cultural immersion for students of all levels. Practice Korean with native speakers, learn from the basics to daily life expressions, and gain a deeper understanding of Korean culture.',
  '$40.00 per semester',
  'Alphabet, Beginner, Intermediate & K-Movie Conversation',
  '3rd grade to adult',
  '["1st Period (Alphabet, Intermediate and K-Movie): 10:00 am - 11:30 am", "2nd Period (Beginner Level): 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKorean_Language_Academy.png?alt=media&token=4a804718-e298-44c5-92e2-cbacb2328c51',
  'Language',
  'Learn the fascinating language of Korean from the native.',
  '["Develop proficiency in speaking, listening, reading, and writing Korean.", "Understand Korean culture better.", "Build relationships and connect with native Korean speakers.", "Enhance opportunities for travel, work, or study in Korea."]'::jsonb,
  'Notebook, pen, and Korean-English dictionary.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FKorean_Language_Academy.png?alt=media&token=4a804718-e298-44c5-92e2-cbacb2328c51',
  'korean',
  '["Alphabet Level: You''ll learn the Korean alphabet, including consonants, vowels, and word combinations, and practice reading and writing simple words.", "Beginner Level: If you learned the consonants and vowels and can read basic words, you can register for the beginner-level.", "Intermediate Level: If you learned basic sentence structures and have some reading skills, you can register for the intermediate-level.", "K-Movie Conversations: Learn natural Korean from real scenes.", "Alphabet & Beginner: 3rd grade to adult.", "Intermediate & K-Movie Conversation: 6th grade to adult."]'::jsonb,
  'active'
),
-- Academy 6: Piano
(
  'Piano', -- name
  'Piano', -- title
  'The Piano Academy offers personalized piano lessons for beginners, covering fundamental music theories and techniques to play your favorite songs.',
  '$80.00 per semester',
  'Level (N/A)',
  '1st grade to adult',
  '["1st Period: 10:00 am - 11:30 am", "2nd Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FPianno.png?alt=media&token=c4209243-8d13-49be-861b-7e7b4d4b7111',
  'Music',
  'Play your heart out and make your dreams come true.',
  '["Master essential techniques for playing the piano.", "Learn music theory.", "Build a diverse repertoire.", "Develop performance skills."]'::jsonb,
  'Piano or keyboard, sheet music.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FPianno.png?alt=media&token=c4209243-8d13-49be-861b-7e7b4d4b7111',
  'piano',
  '[]'::jsonb,
  'active'
),
-- Academy 7: Pickleball
(
  'Pickleball', -- name
  'Pickleball', -- title
  'Pickleball is an exciting sport that demands accuracy, strategy, and physical endurance. Highly competitive and challenging, Pickleball is the fastest-growing sport in the U.S! In this academy, students will learn how to "dink," block, attack, drop, and hit consistent serves. Along with the skills required to excel in the sport, students will learn how to compete effectively with proper court positioning and strategy while maintaining good sportsmanship. Students will also develop a mindset to improve weaknesses through intentional practice and setting reachable goals.',
  '$40.00 per semester',
  'Level (N/A)',
  '6th grade to adult',
  '["One Time Period: 9:30 am - 11:30 am"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FPickleball.png?alt=media&token=a7bef461-c033-47b7-bffc-11a7a3cc733b',
  'Sports',
  'Learn how to play the fastest growing sport in America, Pickleball!',
  '["Gain proficiency in essential skills.", "Learn effective court positioning and strategy.", "Develop good sportsmanship and a mindset."]'::jsonb,
  'Pickleball paddle and ball.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FPickleball.png?alt=media&token=a7bef461-c033-47b7-bffc-11a7a3cc733b',
  'pickleball',
  '[]'::jsonb,
  'active'
),
-- Academy 8: Senior
(
  'Senior', -- name
  'Senior', -- title
  'We''re excited to announce the upcoming Senior Academy, a program designed to provide engaging activities, learning opportunities, and a vibrant community for seniors. Whether you''re looking to stay active, learn new skills, or connect with others, we''ve got something special just for you!',
  '$40.00 per semester',
  'Level (N/A)',
  '55 & up',
  '["One Time Period: 10:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FSenior.png?alt=media&token=878ded97-975d-4be4-8574-44df64bc5b10',
  'Others',
  'Youth begins now!',
  '["Gain proficiency in essential skills.", "Learn effective court positioning and strategy.", "Develop good sportsmanship and a mindset."]'::jsonb,
  'Pickleball paddle and ball.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FSenior.png?alt=media&token=878ded97-975d-4be4-8574-44df64bc5b10',
  'senior',
  '[]'::jsonb,
  'active'
),
-- Academy 9: Soccer
(
  'Soccer', -- name
  'Soccer', -- title
  'Dive into the exciting world of soccer, a sport that sharpens precision, builds teamwork, and ignites a competitive spirit. In this academy, students will learn essential soccer skills like ball control, accurate passing, powerful shooting, and defensive techniques. Beyond mastering the game, they''ll develop strategic thinking, proper positioning, and the resilience needed to thrive on and off the field.',
  '',
  'Open to all skill levels',
  '1st grade to 8th grade',
  '["One-time session: 9:30 am - 11:30 am"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FSoccer.png?alt=media&token=b1e254a0-8332-406d-a49d-5017d3bfce84',
  'Sports',
  'Learn the game, Love the game!',
  '["Build proficiency in fundamental soccer techniques.", "Learn effective strategies for positioning and teamwork.", "Foster sportsmanship, confidence, and a growth mindset."]'::jsonb,
  'Soccer ball and athletic shoes.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FSoccer.png?alt=media&token=b1e254a0-8332-406d-a49d-5017d3bfce84',
  'soccer',
  '["Don''t miss this opportunity to join an action-packed academy that develops skills, confidence, and a passion for soccer. Sign up today and take the first step toward your soccer success!"]'::jsonb,
  'active'
),
-- Academy 10: Stretch and Strengthen
(
  'Stretch and Strengthen', -- name
  'Stretch and Strengthen', -- title
  'Dynamic, diverse, full-body workouts suitable for all fitness levels that simultaneously combine stretching and strengthening while engaging all 650 muscles. These classes will increase flexibility and mobility for a healthy, toned and pain-free body.',
  '',
  'Level (N/A)',
  '6th to adult (female only)',
  '["1st Period: 10:00 am - 11:30 am", "2nd Period: 11:00 am - 12:30 pm"]'::jsonb,
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FStrech%20and%20Strengthen.png?alt=media&token=a2a8e295-578d-44fa-afde-6d59c54c1d32',
  'Sports',
  'Unlock your body!',
  '["Increase your flexibility and overall strength.", "Unlock tight joints.", "Rebalance your body.", "Improve your posture.", "Change the shape of your body.", "Increase bone density.", "Avoid injury in sports or daily activities."]'::jsonb,
  'Yoga mat and comfortable clothing.',
  'https://firebasestorage.googleapis.com/v0/b/iyf-orlando-academy.appspot.com/o/2025%2FFall_Academy_2025%2FAcademy_Poster%2FStrech%20and%20Strengthen.png?alt=media&token=a2a8e295-578d-44fa-afde-6d59c54c1d32',
  'stretchandstrengthen',
  '[]'::jsonb,
  'active'
)
ON CONFLICT (link_name) DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  price = EXCLUDED.price,
  level = EXCLUDED.level,
  age = EXCLUDED.age,
  schedule = EXCLUDED.schedule,
  image = EXCLUDED.image,
  tag = EXCLUDED.tag,
  catch_phrase = EXCLUDED.catch_phrase,
  goal = EXCLUDED.goal,
  equipment = EXCLUDED.equipment,
  academy_details_img = EXCLUDED.academy_details_img,
  note = EXCLUDED.note,
  updated_at = NOW();

-- ============================================
-- Verification
-- ============================================
SELECT 
  COUNT(*) as total_academies,
  COUNT(*) FILTER (WHERE status = 'active') as active_academies
FROM public.academies;

-- ============================================
-- ✅ FIN
-- ============================================

