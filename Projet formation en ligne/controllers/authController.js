// controllers/authController.js
import { v4 as uuidv4 } from "uuid";
import User from "../models/User.js";
import bcrypt from "bcrypt";

export const register = async (req, res) => {
  const { name, email, password, role } = req.body;
  const allowedRoles = ["student", "trainer", "admin"];
  if (!allowedRoles.includes(role)) {
    return res.status(400).json({ error: "Invalid role selected" });
  }

  try {
    // Check if the user already exists
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ error: "Email already in use" });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user
    const newUser = await User.create({
      name,
      email,
      password: hashedPassword,
      role,
      validated: false,
      token: uuidv4(),
    });

    // Return the user with the token
    res.status(201).json({
      id: newUser.id,
      name: newUser.name,
      email: newUser.email,
      role: newUser.role,
      token: newUser.token,
    });
  } catch (error) {
    console.error("Error registering user:", error);
    res.status(500).json({ error: "Error registering user" });
  }
};

export const login = async (req, res) => {
  const { identifier, password } = req.body; // could be email OR name
  console.log("🚀 ~ login ~ identifier:", identifier);

  if (!identifier || !password) {
    return res
      .status(400)
      .json({ error: "Identifier and password are required" });
  }

  try {
    // 1. Try to find by email first
    let user = await User.findOne({ where: { email: identifier } });

    // 2. If not found by email, try name
    if (!user) {
      // Allow for duplicate names — fetch all and check password
      const users = await User.findAll({ where: { name: identifier } });

      for (const u of users) {
        const isMatch = await u.validPassword(password);
        if (isMatch) {
          user = u;
          break;
        }
      }
    }

    if (!user) {
      return res
        .status(404)
        .json({ error: "User not found or invalid password" });
    }

    // 3. Validate password
    const isPasswordValid = await user.validPassword(password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: "Invalid password" });
    }

    // 4. Generate token
    const token = uuidv4();
    user.token = token;
    await user.save();

    // 5. Return user with token
    res.json({
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
      token,
    });
  } catch (error) {
    console.error("Error logging in:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

export const validateUser = async (req, res) => {
  // Implementation for user validation
};

export const approveUser = async (req, res) => {
  // Implementation for user approval
};
