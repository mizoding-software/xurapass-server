package config

import (
	"os"
	"strconv"
	"time"
)

type Config struct {
	Environment	string
	ServerPort	string
	LogLevel	string

	DBHost		string
	DBPort		string
	DBUser		string
	DBPassword	string
	DBName		string
	DBSSLMode	string
	DBMaxConns	int
	DBTimeout	time.Duration

	RedisURL	string
	RedisPass	string
	RedisDB		int

	JWTSecret	string
	JWTExp		time.Duration
	EncryptionKey	string
	BCryptCost	int

	RateLimitRequest	int
	RateLimitWindow		time.Duration

	MetricsEnabled		bool
	MetricsPort			string
}

func Load() (*Config, error) {
	cfg := &Config{
		Environment: getEnv("ENVIRONMENT", "development"),
		ServerPort: getEnv("SERVER_PORT", "8080"),
		LogLevel: getEnv("LOG_LEVEL", "info"),

		DBHost: getEnv("DB_HOST", "localhost"),
		DBPort: getEnv("DB_PORT", "5432"),
		DBUser: getEnv("DB_USER", "xurapass"),
		DBPassword: getEnv("DB_PASSWORD", "password"),
		DBName: getEnv("DB_NAME", "xurapass"),
		DBSSLMode: getEnv("DB_SSL_MODE", "disable"),

		RedisURL: getEnv("REDIS_URL", "redis://localhost:6379"),

		JWTSecret: getEnv("JWT_SECRET", ""),
		JWTExp: getEnvAsDuration("JWT_EXPIRATION", 24 * time.Hour),

		EncryptionKey: getEnv("ENCRYPTION_KEY", ""),
		BCryptCost: getEnvAsInt("BCRYPT_COST", 12),

		RateLimitRequest: getEnvAsInt("RATE_LIMIT_REQUESTS",100),
		RateLimitWindow: getEnvAsDuration("RATE_LIMIT_WINDOW", 1*time.Minute),
	}

	if cfg.JWTSecret == "" {
		panic("JWT_SECRET is required")
	}

	if cfg.EncryptionKey == "" {
		panic("ENCRYPTION_KEY is required")
	}

	return cfg, nil
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

func getEnvAsInt(key string, defaultValue int) int {
	valueStr := getEnv(key, "")
	if value, err := strconv.Atoi(valueStr); err == nil {
		return value
	}
	return defaultValue
}

func getEnvAsDuration(key string, defaultValue time.Duration) time.Duration {
	valueStr := getEnv(key, "")
	if value, err := time.ParseDuration(valueStr); err == nil {
		return value
	}
	return defaultValue
}