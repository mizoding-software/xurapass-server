-- Insert active sessions using dynamic user ID lookup
INSERT INTO user_sessions (user_id, device_id, ip_address, user_agent, browser, os, location, expires_at, is_active, is_trusted)
SELECT id, 'device_macbook_john', '192.168.1.100'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 'Chrome', 'macOS', 'New York, US', NOW() + INTERVAL '7 days', true, true
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'device_iphone_john', '192.168.1.101'::inet, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0)', 'Safari', 'iOS', 'New York, US', NOW() + INTERVAL '30 days', true, true
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'device_windows_jane', '192.168.1.102'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Firefox', 'Windows', 'Los Angeles, US', NOW() + INTERVAL '7 days', true, true
FROM users WHERE username = 'jane_smith'

UNION ALL SELECT id, 'device_linux_mike', '192.168.1.103'::inet, 'Mozilla/5.0 (X11; Linux x86_64)', 'Chrome', 'Linux', 'London, UK', NOW() + INTERVAL '7 days', true, false
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'device_android_sarah', '192.168.1.104'::inet, 'Mozilla/5.0 (Linux; Android 11)', 'Chrome Mobile', 'Android', 'Chicago, US', NOW() + INTERVAL '7 days', true, true
FROM users WHERE username = 'sarah_jones';

-- Insert expired sessions
INSERT INTO user_sessions (user_id, device_id, ip_address, user_agent, browser, os, location, expires_at, is_active, is_trusted)
SELECT id, 'device_old_pc_john', '192.168.1.105'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Edge', 'Windows', 'New York, US', NOW() - INTERVAL '1 day', false, true
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'device_tablet_jane', '192.168.1.106'::inet, 'Mozilla/5.0 (iPad; CPU OS 13_0)', 'Safari', 'iOS', 'Los Angeles, US', NOW() - INTERVAL '2 days', false, false
FROM users WHERE username = 'jane_smith';