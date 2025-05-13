import express from "express";
import bcrypt from "bcrypt"; // Ensure you import bcrypt
import User from "../models/User.js";
import auth from "../middlewares/auth.js";

const router = express.Router();

router.post("/change-password", auth, async (req, res) => {
  const { oldPassword, newPassword } = req.body;

  const token = req.headers.authorization;
  if (!token) return res.status(401).json({ error: "Unauthorized" });

  try {
    const user = await User.findByPk(req.user.id);

    if (!user) {
      return res.status(400).json({ error: "User not found" });
    }

    // Verify the old password
    const isPasswordValid = await bcrypt.compare(oldPassword, user.password);
    if (!isPasswordValid) {
      return res.status(400).json({ error: "Old password is incorrect" });
    }

    // Hash the new password before saving it
    const hashedNewPassword = await bcrypt.hash(newPassword, 10);

    // Update the user's password
    user.password = hashedNewPassword;
    await user.save();

    res.json({ message: "Password updated successfully!" });
  } catch (err) {
    console.error("Error updating password:", err);
    res.status(500).json({ error: "Server error" });
  }
});

export default router;
