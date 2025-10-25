import { defineConfig } from "eslint/config";
import typescriptEslint from "@typescript-eslint/eslint-plugin";
import typescriptParser from "@typescript-eslint/parser";
import globals from "globals";
import prettier from "eslint-plugin-prettier";

export default defineConfig([
	{
		files: ["**/*.ts"],
		languageOptions: {
			parser: typescriptParser,
			globals: {...globals.node},
		},
		plugins: { "@typescript-eslint": typescriptEslint, "prettier": prettier },
		rules: {
			"prettier/prettier": "warn",
			"no-unused-vars": "warn",
			"no-undef": "off",
			"@typescript-eslint/no-unused-vars": "warn",
			"@typescript-eslint/array-type": "error",
			"@typescript-eslint/ban-ts-comment": "error",
		},
	},
]);
