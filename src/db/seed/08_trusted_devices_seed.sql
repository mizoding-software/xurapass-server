INSERT INTO trusted_devices (user_id, device_id, device_name, user_agent, browser, os, ip_address, location, is_trusted)
SELECT id, 'device_macbook_john', 'John''s MacBook Pro', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 'Chrome', 'macOS', '192.168.1.100'::inet, 'New York, US', true
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'device_iphone_john', 'John''s iPhone', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0)', 'Safari', 'iOS', '192.168.1.101'::inet, 'New York, US', true
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'device_windows_jane', 'Jane''s Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'Firefox', 'Windows', '192.168.1.102'::inet, 'Los Angeles, US', true
FROM users WHERE username = 'jane_smith'

UNION ALL SELECT id, 'device_linux_mike', 'Mike''s Linux PC', 'Mozilla/5.0 (X11; Linux x86_64)', 'Chrome', 'Linux', '192.168.1.103'::inet, 'London, UK', false
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'device_android_sarah', 'Sarah''s Android Phone', 'Mozilla/5.0 (Linux; Android 11)', 'Chrome Mobile', 'Android', '192.168.1.104'::inet, 'Chicago, US', true
FROM users WHERE username = 'sarah_jones';