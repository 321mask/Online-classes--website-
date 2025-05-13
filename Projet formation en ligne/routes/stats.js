// routes/stats.js
import express from "express";
import {
  getUserStats,
  getCourseStats,
  getQuizStats,
} from "../controllers/statsController.js";
import authMiddleware from "../middlewares/auth.js";

const router = express.Router();

router.get("/users", authMiddleware, getUserStats);
router.get("/courses", authMiddleware, getCourseStats);
router.get("/quizzes", authMiddleware, getQuizStats);

export default router;
