import express from "express";
import {
  getQuizzes,
  getQuizById,
  createQuiz,
  updateQuiz,
  deleteQuiz,
  submitQuiz,
} from "../controllers/quizController.js";
import authMiddleware, { requireTrainerOrAdmin } from "../middlewares/auth.js";

const router = express.Router();

router.get("/", authMiddleware, getQuizzes);
router.get("/:id", authMiddleware, getQuizById);
router.post("/", authMiddleware, requireTrainerOrAdmin, createQuiz);
router.put("/:id", authMiddleware, requireTrainerOrAdmin, updateQuiz);
router.delete("/:id", authMiddleware, requireTrainerOrAdmin, deleteQuiz);
router.post("/submit", authMiddleware, submitQuiz);

export default router;
