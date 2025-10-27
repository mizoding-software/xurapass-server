const { Client } = require('pg');
require('dotenv').config();

async function testConnection() {
    const client = new Client({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 5432,
        database: process.env.DB_NAME || 'xurapass',
        user: process.env.DB_USER || 'xurapass_user',
        password: process.env.DB_PASSWORD || 'xurapass_password',
    });

    try {
        await client.connect();
        console.log('Database connection successful');

        const result = await client.query('SELECT version()');
        console.log('PostgreSQL version:', result.rows[0].version);

        const tables = await client.query(`
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public'
            ORDER BY table_name    
        `);

        console.log('Tables found:', tables.rows.length);
        console.log('Tables names:', tables.rows.map(row => row.table_name).join(', '));

        await client.end();
        process.exit(0);
    } catch (error) {
        console.error('Database connection failed:', error.message);
        process.exit(1);
    }
}

testConnection();