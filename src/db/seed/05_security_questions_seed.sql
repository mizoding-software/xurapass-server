-- Insert security questions (answers are hashed)
INSERT INTO security_questions (user_id, question, answer_hash)
SELECT id, 'What was the name of your first pet?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'In what city were you born?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'What is your mother''s maiden name?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'jane_smith'

UNION ALL SELECT id, 'What was your first car?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'What is the name of your elementary school?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'sarah_jones'

UNION ALL SELECT id, 'What is your favorite book?', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'
FROM users WHERE username = 'alex_brown';