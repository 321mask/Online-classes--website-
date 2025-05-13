import User from "../models/User.js";
import Course from "../models/Course.js";

export const getUsers = async (req, res) => {
  const users = await User.findAll({
    where: req.user.role === "trainer" ? {} : { role: "student" },
    attributes: ["id", "name", "email", "role", "validated"],
  });
  res.json(users);
};

export const approveUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) return res.status(404).json({ error: "User not found" });

    user.validated = true;
    await user.save();

    res.json({ success: true });
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
};

export const deleteUser = async (req, res) => {
  await User.destroy({ where: { id: req.params.id } });
  res.json({ message: "User deleted" });
};

export const getCourses = async (req, res) => {
  try {
    const courses = await Course.findAll();
    console.log("Courses fetched:", courses); // Log the courses
    res.json(courses);
  } catch (error) {
    console.error("Error fetching courses:", error);
    res.status(500).json({ error: "Failed to fetch courses" });
  }
};

export const deleteCourse = async (req, res) => {
  await Course.destroy({ where: { id: req.params.id } });
  res.json({ message: "Course deleted" });
};
