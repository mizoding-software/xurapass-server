INSERT INTO user_preferences (user_id, language, notifications_email, notifications_sms, notifications_push, theme)
SELECT id, 'en', true, false, true, 'dark' FROM users WHERE username = 'john_doe'
UNION ALL SELECT id, 'en', false, false, true, 'light' FROM users WHERE username = 'jane_smith'
UNION ALL SELECT id, 'en', true, true, false, 'dark' FROM users WHERE username = 'mike_wilson'
UNION ALL SELECT id, 'en', true, false, true, 'light' FROM users WHERE username = 'sarah_jones'
UNION ALL SELECT id, 'en', false, false, false, 'dark' FROM users WHERE username = 'alex_brown'
UNION ALL SELECT id, 'en', true, false, true, 'light' FROM users WHERE username = 'emily_davis'
UNION ALL SELECT id, 'en', false, true, false, 'dark' FROM users WHERE username = 'robert_lee'
UNION ALL SELECT id, 'en', true, false, true, 'light' FROM users WHERE username = 'lisa_taylor'
UNION ALL SELECT id, 'en', false, false, false, 'dark' FROM users WHERE username = 'david_clark'
UNION ALL SELECT id, 'en', true, true, true, 'light' FROM users WHERE username = 'amanda_white';