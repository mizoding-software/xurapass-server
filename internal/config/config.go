package config

import (
	"os"
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
	EncryptKey	string
	BCryptCost	string

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
		
	}
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}