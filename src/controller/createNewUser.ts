import { Request, Response } from "express";
import { createNewUser } from "../models/user.model";

const createNewUserController = async (req: Request, res: Response): Promise<void> => {
	const { username, email, password } = req.body;

	try {
		// Verify user doesn't exists
		const existingUser = await (() => false);
		// const existingUser = checkForUser(); -- Here we check for the user existence

		if (existingUser) {
			res.status(409).json({ error: "User exist", details: "" });
			return;
		}

		const newUser = await createNewUser({ username, email, password });

		if (newUser.status === "created") res.status(200).json({ message: "User created", details: "data, timestampm, ..." });
		return;
	} catch (err: unknown) {
		res.status(500).json({ message: "Internal Server Error", details: "" });
		return;
	}
};
export default createNewUserController;
