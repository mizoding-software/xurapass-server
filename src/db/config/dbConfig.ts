import { Pool } from "pg";
import dotenv from "dotenv";

dotenv.config();

const { POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_PORT, POSTGRES_DB } = process.env;

const config = {
	user: POSTGRES_USER,
	password: POSTGRES_PASSWORD,
	host: POSTGRES_HOST,
	port: parseInt(POSTGRES_PORT),
	database: POSTGRES_DB,
};

export const pool = new Pool(config);
