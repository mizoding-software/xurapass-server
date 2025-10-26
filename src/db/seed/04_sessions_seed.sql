INSERT INTO user_sessions (user_id, device_id, ip_address, user_agent, browser, os, location, expires_at, is_active, is_trusted) VALUES
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'device_macbook_john', '192.168.1.100', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 'Chrome', 'macOS', 'New York, US', NOW() + INTERVAL '7 days', true, true),
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'device_iphone_john', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0)', 'Safari', 'iOS', 'New York, US', NOW() + INTERVAL '30 days', true, true),
('b2c3d4e5-f6g7-8901-bcde-f23456789012', 'device_windows_jane', '192.168.1.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Firefox', 'Windows', 'Los Angeles, US', NOW() + INTERVAL '7 days', true, true),
('c3d4e5f6-g7h8-9012-cdef-345678901234', 'device_linux_mike', '192.168.1.103', 'Mozilla/5.0 (X11; Linux x86_64)', 'Chrome', 'Linux', 'London, UK', NOW() + INTERVAL '7 days', true, false),
('d4e5f6g7-h8i9-0123-defg-456789012345', 'device_android_sarah', '192.168.1.104', 'Mozilla/5.0 (Linux; Android 11)', 'Chrome Mobile', 'Android', 'Chicago, US', NOW() + INTERVAL '7 days', true, true);

INSERT INTO user_sessions (user_id, device_id, ip_address, user_agent, browser, os, location, expires_at, is_active, is_trusted) VALUES
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'device_old_pc_john', '192.168.1.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Edge', 'Windows', 'New York, US', NOW() - INTERVAL '1 day', false, true),
('b2c3d4e5-f6g7-8901-bcde-f23456789012', 'device_tablet_jane', '192.168.1.106', 'Mozilla/5.0 (iPad; CPU OS 13_0)', 'Safari', 'iOS', 'Los Angeles, US', NOW() - INTERVAL '2 days', false, false);