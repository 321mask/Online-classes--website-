import express from "express";
import {
  register,
  login,
  validateUser,
  approveUser,
} from "../controllers/authController.js";
import authMiddleware from "../middlewares/auth.js";

const router = express.Router();

router.post("/register", register);
router.post("/login", login);
router.put("/validate/:id", authMiddleware, validateUser);
router.put("/:id/approve", authMiddleware, approveUser);

export default router;
