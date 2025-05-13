// routes/user.js
import express from "express";
import { getUserById } from "../controllers/userController.js";
import authMiddleware from "../middlewares/auth.js";

const router = express.Router();

router.get("/:id", authMiddleware, getUserById);

export default router;
