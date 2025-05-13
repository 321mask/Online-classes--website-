import express from "express";
import multer from "multer"; // Import multer for file uploads
import {
  getCourses,
  getCourseById,
  createCourse,
  updateCourse,
  deleteCourse,
} from "../controllers/courseController.js";
import authMiddleware from "../middlewares/auth.js";

// Configure Multer storage
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/"); // Directory where files will be stored
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`); // Prevent name conflicts by using timestamp
  },
});

// Initialize Multer with the storage configuration
const upload = multer({ storage: storage });

const router = express.Router();

// Define routes
router.get("/", authMiddleware, getCourses);
router.get("/:id", authMiddleware, getCourseById);

// This route handles file uploads and course creation
router.post("/", upload.array("files"), authMiddleware, createCourse);

router.put("/:id", authMiddleware, updateCourse);
router.delete("/:id", authMiddleware, deleteCourse);

export default router;
