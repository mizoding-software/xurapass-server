INSERT INTO user_profiles (user_id, first_name, last_name, avatar_url, date_of_birth, locale, timezone)
SELECT id, 'John', 'Doe', 'https://example.com/avatars/john.jpg', '1990-05-15'::date, 'en-US', 'America/New_York' FROM users WHERE username = 'john_doe'
UNION ALL SELECT id, 'Jane', 'Smith', 'https://example.com/avatars/jane.jpg', '1985-08-22'::date, 'en-US', 'America/Los_Angeles' FROM users WHERE username = 'jane_smith'
UNION ALL SELECT id, 'Mike', 'Wilson', 'https://example.com/avatars/mike.jpg', '1992-12-01'::date, 'en-GB', 'Europe/London' FROM users WHERE username = 'mike_wilson'
UNION ALL SELECT id, 'Sarah', 'Jones', NULL, '1988-03-30'::date, 'en-US', 'America/Chicago' FROM users WHERE username = 'sarah_jones'
UNION ALL SELECT id, 'Alex', 'Brown', 'https://example.com/avatars/alex.jpg', '1995-07-14'::date, 'en-CA', 'America/Toronto' FROM users WHERE username = 'alex_brown'
UNION ALL SELECT id, 'Emily', 'Davis', NULL, '1993-11-08'::date, 'en-AU', 'Australia/Sydney' FROM users WHERE username = 'emily_davis'
UNION ALL SELECT id, 'Robert', 'Lee', 'https://example.com/avatars/robert.jpg', '1987-02-19'::date, 'en-US', 'America/Denver' FROM users WHERE username = 'robert_lee'
UNION ALL SELECT id, 'Lisa', 'Taylor', NULL, '1991-09-25'::date, 'en-US', 'America/New_York' FROM users WHERE username = 'lisa_taylor'
UNION ALL SELECT id, 'David', 'Clark', 'https://example.com/avatars/david.jpg', '1984-06-11'::date, 'en-GB', 'Europe/London' FROM users WHERE username = 'david_clark'
UNION ALL SELECT id, 'Amanda', 'White', NULL, '1996-04-03'::date, 'en-US', 'America/Los_Angeles' FROM users WHERE username = 'amanda_white';