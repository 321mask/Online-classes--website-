import User from "../models/User.js";
import Course from "../models/Course.js";
import Quiz from "../models/Quiz.js";
import Answer from "../models/Answer.js";

// Get number of users, number of validated users, etc.
export const getUserStats = async (req, res) => {
  try {
    const totalUsers = await User.count();
    const validatedUsers = await User.count({ where: { validated: true } });

    res.json({ totalUsers, validatedUsers });
  } catch (error) {
    console.error("Error fetching user stats:", error);
    res.status(500).json({ error: "Failed to fetch user statistics" });
  }
};

// Get number of courses
export const getCourseStats = async (req, res) => {
  try {
    const totalCourses = await Course.count();

    res.json({ totalCourses });
  } catch (error) {
    console.error("Error fetching course stats:", error);
    res.status(500).json({ error: "Failed to fetch course statistics" });
  }
};

// Get number of quizzes
export const getQuizStats = async (req, res) => {
  try {
    const totalQuizzes = await Quiz.count();
    const quizzes = await Quiz.findAll({ raw: true });

    const results = [];

    for (let quiz of quizzes) {
      const answers = await Answer.findAll({
        where: { quizId: quiz.id },
        include: ["user"],
      });

      for (let answer of answers) {
        results.push({
          user: answer.user.name,
          question: quiz.question,
          isCorrect: quiz.correctAnswer === answer.answer,
        });
      }
    }

    res.json({ totalQuizzes, results });
  } catch (error) {
    console.error("Error fetching quiz stats:", error);
    res.status(500).json({ error: "Failed to fetch quiz statistics" });
  }
};
