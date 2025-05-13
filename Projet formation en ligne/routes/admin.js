import express from "express";
import {
  getUsers,
  approveUser,
  deleteUser,
  getCourses,
  deleteCourse,
} from "../controllers/adminController.js";
import authMiddleware from "../middlewares/auth.js";

const router = express.Router();

router.get("/users", authMiddleware, getUsers);
router.put("/users/:id/approve", authMiddleware, approveUser);
router.delete("/users/:id", authMiddleware, deleteUser);
router.get("/courses", authMiddleware, getCourses);
router.delete("/courses/:id", authMiddleware, deleteCourse);

export default router;
