import User from "./User.js";
import Course from "./Course.js";
import Answer from "./Answer.js";

// Define model associations here
User.hasMany(Course, { foreignKey: "trainerId" });
Course.belongsTo(User, { foreignKey: "trainerId" });
Answer.belongsTo(User, { foreignKey: "userId", as: "user" });

export default function applyAssociations() {
  // This is just a semantic wrapper if you want to call it during setup
}
