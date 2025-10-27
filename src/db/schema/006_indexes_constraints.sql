-- ===== THIS FILE IS JUST FOR TESTING - NO PRODCTION BEHAVIOUR =====

-- ===== DROP ALL INDEXES =====

-- Users table indexes
DROP INDEX IF EXISTS idx_users_email;
DROP INDEX IF EXISTS idx_users_username;
DROP INDEX IF EXISTS idx_users_account_status;
DROP INDEX IF EXISTS idx_users_created_at;

-- Session indexes
DROP INDEX IF EXISTS idx_user_sessions_user_id;
DROP INDEX IF EXISTS idx_user_sessions_expires_at;
DROP INDEX IF EXISTS idx_user_sessions_device_id;

-- Refresh token indexes
DROP INDEX IF EXISTS idx_refresh_tokens_user_id;
DROP INDEX IF EXISTS idx_refresh_tokens_expires_at;

-- Security indexes
DROP INDEX IF EXISTS idx_password_reset_tokens_user_id;
DROP INDEX IF EXISTS idx_password_reset_tokens_expires_at;
DROP INDEX IF EXISTS idx_email_verification_tokens_user_id;
DROP INDEX IF EXISTS idx_email_verification_tokens_expires_at;

-- Audit indexes
DROP INDEX IF EXISTS idx_login_attempts_user_id;
DROP INDEX IF EXISTS idx_login_attempts_timestamp;
DROP INDEX IF EXISTS idx_login_attempts_ip_address;
DROP INDEX IF EXISTS idx_security_events_user_id;
DROP INDEX IF EXISTS idx_security_events_timestamp;
DROP INDEX IF EXISTS idx_security_events_severity;

-- Password history index
DROP INDEX IF EXISTS idx_password_history_user_id;

-- Partial indexes
DROP INDEX IF EXISTS idx_active_sessions;
DROP INDEX IF EXISTS idx_valid_refresh_tokens;

-- Drop trigger
DROP TRIGGER IF EXISTS update_users_updated_at ON users;
DROP FUNCTION IF EXISTS update_updated_at_column;

-- ===== RECREATE ALL INDEXES =====

-- Users table indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_account_status ON users(account_status);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Session indexes
CREATE INDEX idx_user_sessions_user_id ON user_sessions(user_id);
CREATE INDEX idx_user_sessions_expires_at ON user_sessions(expires_at) WHERE is_active = true;
CREATE INDEX idx_user_sessions_device_id ON user_sessions(device_id);

-- Refresh token indexes
CREATE INDEX idx_refresh_tokens_user_id ON refresh_tokens(user_id);
CREATE INDEX idx_refresh_tokens_expires_at ON refresh_tokens(expires_at) WHERE is_revoked = false;

-- Security indexes
CREATE INDEX idx_password_reset_tokens_user_id ON password_reset_tokens(user_id);
CREATE INDEX idx_password_reset_tokens_expires_at ON password_reset_tokens(expires_at) WHERE used = false;

CREATE INDEX idx_email_verification_tokens_user_id ON email_verification_tokens(user_id);
CREATE INDEX idx_email_verification_tokens_expires_at ON email_verification_tokens(expires_at) WHERE verified = false;

-- Audit indexes
CREATE INDEX idx_login_attempts_user_id ON login_attempts(user_id);
CREATE INDEX idx_login_attempts_timestamp ON login_attempts(timestamp);
CREATE INDEX idx_login_attempts_ip_address ON login_attempts(ip_address);

CREATE INDEX idx_security_events_user_id ON security_events(user_id);
CREATE INDEX idx_security_events_timestamp ON security_events(timestamp);
CREATE INDEX idx_security_events_severity ON security_events(severity);

-- Password history index
CREATE INDEX idx_password_history_user_id ON password_history(user_id);

-- Partial indexes for better performance
CREATE INDEX idx_active_sessions ON user_sessions(user_id) WHERE is_active = true;
CREATE INDEX idx_valid_refresh_tokens ON refresh_tokens(user_id) WHERE is_revoked = false;

-- Update updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();