INSERT INTO login_attempts (user_id, username, ip_address, user_agent, device_id, successful, failure_reason) VALUES
-- Successful logins
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'john_doe', '192.168.1.100', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 'device_macbook_john', true, NULL),
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'john_doe', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0)', 'device_iphone_john', true, NULL),
('b2c3d4e5-f6g7-8901-bcde-f23456789012', 'jane_smith', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'device_windows_jane', true, NULL),
('c3d4e5f6-g7h8-9012-cdef-345678901234', 'mike_wilson', '192.168.1.103', 'Mozilla/5.0 (X11; Linux x86_64)', 'device_linux_mike', true, NULL),

-- Failed logins
('c3d4e5f6-g7h8-9012-cdef-345678901234', 'mike_wilson', '192.168.1.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'),
('c3d4e5f6-g7h8-9012-cdef-345678901234', 'mike_wilson', '192.168.1.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'),
('g7h8i9j0-k1l2-3456-ghij-789012345678', 'robert_lee', '192.168.1.202', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', NULL, false, 'invalid_password'),
('g7h8i9j0-k1l2-3456-ghij-789012345678', 'robert_lee', '192.168.1.203', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', NULL, false, 'account_locked'),
('h8i9j0k1-l2m3-4567-hijk-890123456789', 'lisa_taylor', '192.168.1.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'),

-- Attempts on non-existent users
(NULL, 'hacker_user', '192.168.1.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'user_not_found'),
(NULL, 'admin', '192.168.1.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'user_not_found');