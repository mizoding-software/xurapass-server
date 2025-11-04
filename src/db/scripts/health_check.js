const { Client } = require("pg");

async function healthCheck() {
	const client = new Client({
		host: process.env.DB_HOST || "localhost",
		port: process.env.DB_PORT || 5432,
		database: process.env.DB_NAME || "xurapass",
		user: process.env.DB_USER || "xurapass_user",
		password: process.env.DB_PASSWORD || "xurapass_password",
	});

	try {
		await client.connect();
		await client.query("SELECT 1");

		const connections = await client.query(
			`
            SELECT COUNT(*) as active_connections
            FROM pg_stat_activity
            WHERE datname = $1    
        `,
			[process.env.DB_NAME || "xurapass"]
		);

		const size = await client.query(
			`
            SELECT pg_size_pretty(pg_database_size($1)) as size
        `,
			[process.env.DB_NAME || "xurapass"]
		);

		await client.end();

		return {
			status: "healthy",
			database: process.env.DB_NAME || "xurapass",
			active_connections: parseInt(connections.rows[0].active_connections),
			size: size.rows[0].size,
			timestamp: new Date().toISOString(),
		};
	} catch (error) {
		return {
			status: "unhealthy",
			error: error.message,
			timestamp: new Date().toISOString(),
		};
	}
}

if (require.main === module) {
	healthCheck().then((status) => {
		console.log(JSON.stringify(status, null, 2));
		process.exit(status.status === "healthy" ? 0 : 1);
	});
}

module.exports = healthCheck;
