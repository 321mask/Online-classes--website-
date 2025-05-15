import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";
import User from "./User.js";
import Quiz from "./Quiz.js";

const Certificate = sequelize.define("Certificate", {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  quizId: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  score: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  dateIssued: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  certificateUrl: {
    type: DataTypes.STRING,
    allowNull: true, // you can generate and save a URL for the PDF/HTML file
  },
});

// Associations
Certificate.belongsTo(User, { foreignKey: "userId" });
Certificate.belongsTo(Quiz, { foreignKey: "quizId" });

export default Certificate;
