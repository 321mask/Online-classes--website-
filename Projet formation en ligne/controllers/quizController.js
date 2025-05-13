import Quiz from "../models/Quiz.js";
import Answer from "../models/Answer.js";
import { io } from "../server.js";
import User from "../models/User.js";
import Feedback from "../models/feedback.js";

// Get all quizzes
export const getQuizzes = async (req, res) => {
  try {
    const quizzes = await Quiz.findAll();
    res.json(quizzes);
  } catch (error) {
    console.error("Error fetching quizzes:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Get quiz by ID
export const getQuizById = async (req, res) => {
  try {
    const quiz = await Quiz.findByPk(req.params.id);
    if (!quiz) return res.status(404).json({ error: "Quiz not found" });
    res.json(quiz);
  } catch (error) {
    console.error("Error fetching quiz:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Create a new quiz
export const createQuiz = async (req, res) => {
  try {
    const { courseId, question, options, correctAnswer } = req.body;
    const newQuiz = await Quiz.create({
      courseId,
      question,
      options,
      correctAnswer,
    });
    res.status(201).json(newQuiz);
  } catch (error) {
    console.error("Error creating quiz:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Update a quiz
export const updateQuiz = async (req, res) => {
  try {
    const quiz = await Quiz.findByPk(req.params.id);
    if (!quiz) return res.status(404).json({ error: "Quiz not found" });

    const { question, options, correctAnswer } = req.body;
    await quiz.update({ question, options, correctAnswer });
    res.json(quiz);
  } catch (error) {
    console.error("Error updating quiz:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Delete a quiz
export const deleteQuiz = async (req, res) => {
  try {
    const quiz = await Quiz.findByPk(req.params.id);
    if (!quiz) return res.status(404).json({ error: "Quiz not found" });

    await quiz.destroy();
    res.json({ message: "Quiz deleted successfully" });
  } catch (error) {
    console.error("Error deleting quiz:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

export const submitQuiz = async (req, res) => {
  try {
    const { answers } = req.body;
    const userId = req.user.id;

    if (!answers || typeof answers !== "object") {
      return res.status(400).json({ error: "Invalid answers format" });
    }

    const quizIds = Object.keys(answers);
    const quizzes = await Quiz.findAll({
      where: {
        id: quizIds,
      },
    });

    const user = await User.findByPk(userId);
    let score = 0;

    for (let quiz of quizzes) {
      const submittedAnswer = answers[quiz.id];
      const isCorrect = submittedAnswer === quiz.correctAnswer;

      if (isCorrect) score++;

      // Save answer to DB
      await Answer.create({
        userId,
        quizId: quiz.id,
        answer: submittedAnswer,
      });

      // Emit individual quiz result for real-time updates
      io.emit("quizResults", {
        user: user.name,
        question: quiz.question,
        isCorrect,
      });
    }

    // Calculate feedback after all quizzes
    const scorePercentage = (score / quizzes.length) * 100;
    let feedbackMessage = "";

    if (scorePercentage >= 80) {
      feedbackMessage = "Excellent travail! Vous avez un score parfait!";
    } else if (scorePercentage >= 50) {
      feedbackMessage =
        "Bien joué, mais il y a encore de la place pour l'amélioration.";
    } else {
      feedbackMessage = "Dommage! Révisez les questions et réessayez.";
    }

    // Save feedback (if you want to save it)
    await Feedback.create({
      userId,
      quizId: quizzes[0].id, // Adjust this if needed
      score,
      feedbackMessage,
    });

    res.json({ score, feedbackMessage });
  } catch (error) {
    console.error("Error submitting quiz:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
