import User from "../models/User.js"; // Ensure the path is correct

const auth = async (req, res, next) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];
    console.log("🚀 ~ auth ~ token:", token);

    if (!token) {
      return res.status(401).json({ error: "Token not found" });
    }

    const user = await User.findOne({ where: { token } });
    console.log("🚀 ~ auth ~ user:", user);

    if (!user) {
      return res.status(401).json({ error: "User not found" });
    }

    // If student, check validation
    if (user.role === "student" && !user.validated) {
      return res.status(403).json({
        error: "Your account is not yet validated by a teacher.",
      });
    }

    if (user.role === "admin" && !user.validated) {
      user.validated = true;
      await user.save();
    }

    // Auto-validate trainers (previously "teacher")
    if (user.role === "trainer" && !user.validated) {
      user.validated = true;
      await user.save(); // Save the updated validation state
    }

    req.user = user.get();
    next();
  } catch (error) {
    console.error("Authentication error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// 🔒 For trainer/admins-only routes
export const requireTrainerOrAdmin = (req, res, next) => {
  const role = req.user?.role;

  if (role !== "trainer" && role !== "admin") {
    return res
      .status(403)
      .json({ error: "Only trainers or admins can create quizzes" });
  }

  next();
};

export default auth;
