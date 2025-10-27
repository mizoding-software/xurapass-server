INSERT INTO security_events (user_id, event_type, ip_address, user_agent, details, severity)
SELECT id, 'password_changed', '192.168.1.100'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', '{"method": "user_initiated"}'::jsonb, 'medium'
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'mfa_enabled', '192.168.1.100'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', '{"method": "authenticator_app"}'::jsonb, 'medium'
FROM users WHERE username = 'john_doe'

UNION ALL SELECT id, 'email_changed', '192.168.1.102'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '{"old_email": "jane.old@example.com", "new_email": "jane.smith@example.com"}'::jsonb, 'high'
FROM users WHERE username = 'jane_smith'

UNION ALL SELECT id, 'failed_login', '192.168.1.200'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '{"attempts": 2, "lock_duration": "30 minutes"}'::jsonb, 'medium'
FROM users WHERE username = 'mike_wilson'

UNION ALL SELECT id, 'account_locked', '192.168.1.202'::inet, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', '{"reason": "too_many_failed_attempts", "lock_until": "2024-01-20 14:30:00"}'::jsonb, 'high'
FROM users WHERE username = 'robert_lee'

UNION ALL SELECT id, 'account_locked', '192.168.1.204'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '{"reason": "too_many_failed_attempts", "lock_until": "2024-01-20 15:00:00"}'::jsonb, 'high'
FROM users WHERE username = 'lisa_taylor'

-- Events without user_id
UNION ALL SELECT NULL, 'brute_force_attempt', '192.168.1.205'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '{"targeted_usernames": ["admin", "hacker_user"], "attempts": 15}'::jsonb, 'critical'

UNION ALL SELECT NULL, 'suspicious_activity', '192.168.1.210'::inet, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '{"description": "Multiple failed login attempts from unusual location"}'::jsonb, 'high';