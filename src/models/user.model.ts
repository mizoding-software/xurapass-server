import { pool } from "../db/config/dbConfig";
import { NewUserModelData, UserModelData } from "../types";

export const createNewUser = async (userData: NewUserModelData): Promise<void> => {
	const { username, email, password } = userData;
	let client;

	try {
		client = await pool.connect();

		// create
		await client.query("BEGIN");

		const query = "INSERT INTO users(username, email, password_hash) VALUES($1,$2,$3)";
		const vals = [username, email, password];

		const res = await client.query(query, vals);
		await client.query("COMMIT");

		console.log(res, "Test");
	} catch (err: any) {
		if (client) {
			await client.query("ROLLBACK");
		}
		console.error("Database error", err);
		throw err;
	} finally {
		if (client) client.release();
	}
};
(async () => {
	try {
		console.log("Starting user creation");
		await createNewUser({ username: "angle", email: "test", password: "d" });
		console.log("User created successfully");
	} catch (err) {
		console.error("Failed to create user", err);
	}
})();

// Search
export const searchUser = () => {};
export const getUserById = () => {};
export const getUserByUsername = () => {};
export const getUserByEmail = () => {};

// User Management
export const updateUserProfile = () => {};
export const deactivateUser = () => {};
export const deleteUser = () => {};
export const changeEmail = () => {};
export const changeUsername = () => {};

// Password Management
export const recoverPassword = () => {};
export const changePassword = () => {};
export const validatePasswordResetToken = () => {};
export const expirePasswordResetTokens = () => {};
export const forcePasswordChange = () => {};

// Auth & Session Management
export const validatePassword = () => {};
export const createSession = () => {};
export const invalidSession = () => {};
export const refreshToken = () => {};
export const verifyToken = () => {};

// Account Verification
export const verifyEmail = () => {};
export const sendVerificationEmail = () => {};
export const verifyPhone = () => {};

// Security Features
export const lockAccount = () => {};
export const unlockAccount = () => {};
export const checkPasswordStrength = () => {};
export const logSecurityEvent = () => {};
export const checkSuspiciousActivity = () => {};

// Multi-Factor Auth
export const enableMFA = () => {};
export const disableMFA = () => {};
export const verifyMFA = () => {};
export const generateMFABackupCodes = () => {};

// Admin User Management
export const listUsers = () => {};
export const getUserSessions = () => {};
export const getUserStats = () => {};

// Security & Compliance
export const exportUserData = () => {};
export const anonymizeUserData = () => {};
export const checkCompliance = () => {};
