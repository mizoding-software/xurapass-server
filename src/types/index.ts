export interface NewUserModelData {
	username: string;
	email: string;
	password: string;
}

export interface UserModelData {
	id: string;
	username: string;
	email: string;
	password: string;
	phone?: string;
	token?: string;

	account_status: "active" | "inactive" | "locked" | "suspended" | "deleted";
	account_verification_status: "pending" | "verified" | "rejected";
	email_verified: boolean;
	phone_verified: boolean;

	mfa_enabled: boolean;
	mfa_secret?: string;
	mfa_backup_codes?: string[];
	password_history: string[];
	password_changed_at: Date;
	failed_login_attempts: number;
	lock_until?: Date;

	current_sessions: SessionData[];
	refresh_tokens: RefreshTokenData[];

	created_at: Date;
	updated_at: Date;
	last_login_at?: Date;
	last_password_change_at: Date;
	last_email_change_at?: Date;

	profile?: UserProfile;
	preferences?: UserPreferences;

	terms_accepted_at: Date;
	privacy_policy_accepted_at: Date;
	marketing_emails_opted_in: boolean;

	security_questions?: SecurityQuestions[];
	recovery_email?: string;
	backup_phone?: string;

	login_history: LoginAttempt[];
	security_events: SecurityEvent[];
	trusted_devices: DeviceFingerprint[];
}

interface SessionData {
	session_id: string;
	device_info: DeviceFingerprint;
	ip_address: string;
	created_at: Date;
	expires_at: Date;
	last_activity: Date;
	is_active: boolean;
}

interface RefreshTokenData {
	token: string;
	device_id: string;
	created_at: Date;
	expires_at: Date;
	is_revoked: boolean;
}

interface DeviceFingerprint {
	device_id: string;
	user_agent: string;
	browser: string;
	os: string;
	ip_address: string;
	location?: string;
	first_seen: Date;
	last_seen: Date;
	is_trusted: boolean;
}

interface LoginAttempt {
	timestamp: Date;
	ip_address: string;
	user_agent: string;
	successful: boolean;
	failure_reason?: string;
	device_id?: string;
}

interface SecurityEvent {
	event_type: string;
	timestamp: Date;
	ip_address: string;
	user_agent?: string;
	details: any;
	severitty: "low" | "medium" | "high" | "critical";
}

interface SecurityQuestions {
	question: string;
	answer_hash: string;
	created_at: Date;
}

interface UserProfile {
	first_name?: string;
	last_name?: string;
	avatar_url?: string;
	date_of_birth?: Date;
	locale?: string;
	timezone?: string;
}

interface UserPreferences {
	language: string;
	notifications: {
		email: boolean;
		sms: boolean;
		push: boolean;
	};
	theme?: "light" | "dark";
}

interface PasswordResetToken {
	token: string;
	user_id: string;
	expires_at: Date;
	used: boolean;
	ip_address: string;
}

interface EmailVerificationToken {
	token: string;
	user_id: string;
	email: string;
	expires_at: Date;
	verified: boolean;
}

interface UserListFilters {
	status?: string[];
	verified?: boolean;
	mfa_enabled?: boolean;
	date_range?: {
		start: Date;
		end: Date;
	};
	search?: string;
}

interface PaginationParams {
	page: number;
	limit: number;
	sort_by?: string;
	sort_order?: "asc" | "desc";
}
