import express from "express";
import dotenv from "dotenv";
import cors from "cors";

import router from "./routes";

import { warnMessages } from "./messages/warnMessages";
import { colorize } from "./utils/consoleColors";

dotenv.config();

const { PORT } = process.env;

if (!PORT) console.warn(`${colorize.yellow}${warnMessages.portUndefined}${colorize.reset}`);

const app = express();
const port = parseInt(PORT) || 3030;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.use(router);
app.listen(port, () => console.log(`Server running on: http://localhost:${port}`));
