CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),

    -- Account status
    account_status VARCHAR(20) NOT NULL DEFAULT 'active' 
        CHECK (account_status IN ('active', 'inactive', 'locked', 'suspended', 'deleted')),
    account_verification_status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (account_verification_status IN ('pending', 'verified', 'rejected')),
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    phone_verified BOOLEAN NOT NULL DEFAULT FALSE,

    -- MFA
    mfa_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    mfa_secret VARCHAR(255),
    mfa_backup_codes TEXT[],

    -- Security
    failed_login_attempts INTEGER NOT NULL DEFAULT 0,
    lock_until TIMESTAMP WITH TIME ZONE,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    last_login_at TIMESTAMP WITH TIME ZONE,
    last_password_change_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    last_email_change_at TIMESTAMP WITH TIME ZONE,

    -- Compliance
    terms_accepted_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    privacy_policy_accepted_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    marketing_emails_opted_in BOOLEAN NOT NULL DEFAULT FALSE,

    -- Recovery
    recovery_email VARCHAR(255),
    backup_phone VARCHAR(20)
);

CREATE TABLE user_profiles (
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    avatar_url TEXT,
    date_of_birth DATE,
    locale VARCHAR(10) DEFAULT 'en-US',
    timezone VARCHAR(50) DEFAULT 'UTC'
);

CREATE TABLE user_preferences (
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    language VARCHAR(10) NOT NULL DEFAULT 'en',
    notifications_email BOOLEAN NOT NULL DEFAULT TRUE,
    notifications_sms BOOLEAN NOT NULL DEFAULT FALSE,
    notifications_push BOOLEAN NOT NULL DEFAULT TRUE,
    theme VARCHAR(10) DEFAULT 'light' CHECK (theme IN ('light', 'dark'))
);