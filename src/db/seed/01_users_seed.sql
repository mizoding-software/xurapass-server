INSERT INTO users (id, username, email, password_hash, phone, account_status, account_verification_status, email_verified, phone_verified, mfa_enabled, failed_login_attempts, marketing_emails_opted_in, recovery_email, backup_phone) VALUES
-- Active users
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'john_doe', 'john.doe@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567890', 'active', 'verified', true, true, true, 0, true, 'john.backup@example.com', '+1234567891'),
('b2c3d4e5-f6g7-8901-bcde-f23456789012', 'jane_smith', 'jane.smith@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567892', 'active', 'verified', true, false, false, 0, false, 'jane.backup@example.com', NULL),
('c3d4e5f6-g7h8-9012-cdef-345678901234', 'mike_wilson', 'mike.wilson@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567893', 'active', 'verified', true, true, true, 2, true, NULL, '+1234567894'),
('d4e5f6g7-h8i9-0123-defg-456789012345', 'sarah_jones', 'sarah.jones@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567895', 'active', 'verified', true, false, false, 0, true, 'sarah.backup@example.com', NULL),

-- Pending verification
('e5f6g7h8-i9j0-1234-efgh-567890123456', 'alex_brown', 'alex.brown@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567896', 'active', 'pending', false, false, false, 0, false, NULL, NULL),
('f6g7h8i9-j0k1-2345-fghi-678901234567', 'emily_davis', 'emily.davis@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'active', 'pending', false, false, false, 1, true, 'emily.backup@example.com', NULL),

-- Locked accounts
('g7h8i9j0-k1l2-3456-ghij-789012345678', 'robert_lee', 'robert.lee@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567897', 'locked', 'verified', true, true, false, 5, false, NULL, NULL),
('h8i9j0k1-l2m3-4567-hijk-890123456789', 'lisa_taylor', 'lisa.taylor@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567898', 'locked', 'verified', true, false, true, 7, true, 'lisa.backup@example.com', '+1234567899'),

-- Inactive accounts
('i9j0k1l2-m3n4-5678-ijkl-901234567890', 'david_clark', 'david.clark@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1234567800', 'inactive', 'verified', true, true, false, 0, false, NULL, NULL),
('j0k1l2m3-n4o5-6789-jklm-012345678901', 'amanda_white', 'amanda.white@example.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'inactive', 'verified', true, false, false, 0, true, 'amanda.backup@example.com', NULL);