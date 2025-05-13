import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";
import Quiz from "./Quiz.js";
import User from "./User.js";

const Answer = sequelize.define("Answer", {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  quizId: {
    type: DataTypes.INTEGER,
    references: { model: Quiz, key: "id" },
  },
  userId: { type: DataTypes.INTEGER, references: { model: User, key: "id" } },
  answer: { type: DataTypes.STRING, allowNull: false },
});

export default Answer;
