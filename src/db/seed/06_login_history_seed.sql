INSERT INTO login_attempts (user_id, username, ip_address, user_agent, device_id, successful, failure_reason)
-- Successful logins
SELECT id, 'john_doe', '192.168.1.100'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 'device_macbook_john', true, NULL
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'john_doe', '192.168.1.101'::inet, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0)', 'device_iphone_john', true, NULL
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'jane_smith', '192.168.1.102'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'device_windows_jane', true, NULL
FROM users WHERE username = 'jane_smith'

UNION ALL SELECT id, 'mike_wilson', '192.168.1.103'::inet, 'Mozilla/5.0 (X11; Linux x86_64)', 'device_linux_mike', true, NULL
FROM users WHERE username = 'mike_wilson'

-- Failed logins
UNION ALL SELECT id, 'mike_wilson', '192.168.1.200'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'mike_wilson', '192.168.1.201'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'robert_lee', '192.168.1.202'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', NULL, false, 'invalid_password'
FROM users WHERE username = 'robert_lee'

UNION ALL SELECT id, 'robert_lee', '192.168.1.203'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', NULL, false, 'account_locked'
FROM users WHERE username = 'robert_lee'

UNION ALL SELECT id, 'lisa_taylor', '192.168.1.204'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'invalid_password'
FROM users WHERE username = 'lisa_taylor'

-- Attempts on non-existent users (no user_id)
UNION ALL SELECT NULL, 'hacker_user', '192.168.1.205'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'user_not_found'

UNION ALL SELECT NULL, 'admin', '192.168.1.206'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', NULL, false, 'user_not_found';