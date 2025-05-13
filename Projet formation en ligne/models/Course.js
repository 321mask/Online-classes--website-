import { DataTypes } from "sequelize";
import sequelize from "../config/db.js";
import User from "./User.js";

const Course = sequelize.define("Course", {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  title: { type: DataTypes.STRING, allowNull: false },
  description: { type: DataTypes.TEXT, allowNull: false },
  content: { type: DataTypes.TEXT, allowNull: false },
  trainerId: {
    type: DataTypes.INTEGER,
    references: { model: User, key: "id" },
  },
  files: { type: DataTypes.JSON, allowNull: true },
});
Course.belongsTo(User, { foreignKey: "trainerId" });

export default Course;
