import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";

const Feedback = sequelize.define("Feedback", {
  score: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  feedbackMessage: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  quizId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

export default Feedback;
