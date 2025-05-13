import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";
import Course from "./Course.js";

const Quiz = sequelize.define("Quiz", {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  courseId: {
    type: DataTypes.INTEGER,
    references: { model: Course, key: "id" },
  },
  question: { type: DataTypes.TEXT, allowNull: false },
  options: { type: DataTypes.JSON, allowNull: false },
  correctAnswer: { type: DataTypes.STRING, allowNull: false },
});

export default Quiz;
