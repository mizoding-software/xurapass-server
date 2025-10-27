const { Client } = require('pg');

async function testIntegrity() {
  const client = new Client({
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    database: process.env.DB_NAME || 'xurapass',
    user: process.env.DB_USER || 'xurapass_user',
    password: process.env.DB_PASSWORD || 'xurapass_password',
  });

  try{
    await client.connect();

    console.log('=== Running Database Integrity Tests ===');

    const expectedTables = [
        'users', 'user_profiles', 'user_preferences', 'user_sessions',
        'security_questions', 'login_attempts', 'security_events', 'trusted_devices',
        'password_history', 'refresh_tokens', 'password_reset_tokens', 'email_verification_tokens'

    ];

    const tablesResult = await client.query(`
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'    
    `);

    const existingTables = tablesResult.rows.map(row => row.table_name);
    const missingTables = expectedTables.filter(table => !existingTables.includes(table));
    
    if(missingTables.length > 0) {
        throw new Error('Missing tables:', missingTables.join(', '));
    }
    console.log('All expected tables exist');

    const userCount = await client.query('SELECT COUNT(*) FROM users');
    console.log('Users seeded:', userCount.rows[0].count);

    const orphanedProfiles = await client.query(`
        SELECT COUNT(*)
        FROM user_profiles p
        LEFT JOIN users u ON p.user_id = u.id
        WHERE u.id IS NULL    
    `);

    if(parseInt(orphanedProfiles.rows[0].count) > 0) {
        throw new Error('Found orphaned user profiles');
    }
    console.log('No orphaned user profiles');

    const statusResult = await client.query(`
        SELECT account_status, COUNT(*)
        FROM users
        GROUP BY account_status    
    `);

    console.log('Account status distribution:', statusResult.rows);

    console.log('=== All integrity tests passed ===');
    await client.end();
    process.exit(0);
}catch(error){
    console.error('Integrity test failed:', error.message);
    await client.end();
    process.exit(1);
}
}
testIntegrity();