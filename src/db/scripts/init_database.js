const { exec } = require('child_process');
const { promisify } = require('util');
const execAsync = promisify(exec);
const fs = require('fs');
const path = require('path');

async function runSQLFile(filePath) {
    const fileName = path.basename(filePath);
    const containerPath = `/tmp/${fileName}`;

    console.log(`📁 Executing: ${fileName}`);

    try {
        await execAsync(`docker cp "${filePath}" xurapass-postgres:${containerPath}`);

        const command = `docker exec xurapass-postgres psql -U xurapass_user -d xurapass -f ${containerPath}`;
        const { stdout, stderr } = await execAsync(command);

        if (stdout) console.log(stdout);
        if (stderr && !stderr.includes('NOTICE')) console.error(stderr);

        await execAsync(`docker exec xurapass-postgres rm ${containerPath}`);

        return true;
    } catch (error) {
        console.error(`❌ Failed: ${fileName}`);
        console.error(error.stderr || error.message);
        return false;
    }
}

async function initializeDatabase() {
    console.log('🚀 Starting database initialization...\n');

    try {
        await execAsync('docker ps | grep xurapass-postgres');
        console.log('✅ Database container is running');
    } catch (error) {
        console.log('📦 Starting database container...');
        await execAsync('npm run db:up');

        console.log('⏳ Waiting for database to be ready...');
        let attempts = 0;
        let dbReady = false;

        while (attempts < 30 && !dbReady) {
            try {
                await execAsync('docker exec xurapass-postgres pg_isready -U xurapass_user -d xurapass');
                dbReady = true;
                console.log('✅ Database is ready!');
            } catch (error) {
                attempts++;
                console.log(`   Attempt ${attempts}/30...`);
                await new Promise(resolve => setTimeout(resolve, 2000));
            }
        }

        if (!dbReady) {
            console.error('❌ Database failed to start within timeout');
            process.exit(1);
        }
    }

    console.log('\n📋 Creating schema...');
    const schemaDir = path.join(__dirname, '../schema');

    if (!fs.existsSync(schemaDir)) {
        console.error(`❌ Schema directory not found: ${schemaDir}`);
        process.exit(1);
    }

    const schemaFiles = fs.readdirSync(schemaDir)
        .filter(f => f.endsWith('.sql'))
        .sort();

    console.log(`Found ${schemaFiles.length} schema files:`, schemaFiles);

    for (const file of schemaFiles) {
        const filePath = path.join(schemaDir, file);
        if (!await runSQLFile(filePath)) {
            process.exit(1);
        }
    }

    console.log('\n🌱 Seeding data...');
    const seedDir = path.join(__dirname, '../seed');

    if (!fs.existsSync(seedDir)) {
        console.error(`❌ Seed directory not found: ${seedDir}`);
        process.exit(1);
    }

    const seedFiles = fs.readdirSync(seedDir)
        .filter(f => f.endsWith('.sql'))
        .sort();

    console.log(`Found ${seedFiles.length} seed files:`, seedFiles);

    for (const file of seedFiles) {
        const filePath = path.join(seedDir, file);
        if (!await runSQLFile(filePath)) {
            process.exit(1);
        }
    }

    console.log('\n🎉 Database initialization complete!');
}

initializeDatabase();