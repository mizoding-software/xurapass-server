package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
	"xurapass-server/internal/config"
	"xurapass-server/internal/server"
	"xurapass-server/pkg/logger"
)

// @title Xurapass API
// @version 1.0
// @description Deterministic Password Manager Backend
// @securityDefinitions.apikey BearerAuth
// @in header
// @name Authorization
func main(){
	cfg, err := config.Load()
	if err != nil {
		log.Fatalf("Failed to load config: %v", err)
	}

	appLogger, err := logger.New(cfg)
	if err != nil {
		log.Fatalf("Failed to initialize logger: %v", err)
	}
	defer appLogger.Sync()

	srv := server.New(cfg, appLogger)

	go func() {
		appLogger.Info("Starting server", "port", cfg.ServerPort, "environment", cfg.Environment)
		if err := srv.Start(); err != nil {
			appLogger.Fatal("Server failed to start", "error", err)
		}

	}()

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit

	appLogger.Info("Shutting down server...")
	srv.Shutdown()
	appLogger.Info("Server exited")
}