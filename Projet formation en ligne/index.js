import express from "express";
import sequelize from "./config/db.js";
import userRoutes from "./routes/user.js";

const app = express();
app.use(express.json());

app.use("/api/users", userRoutes);

// Sync Database
sequelize
  .sync({ alter: true }) // Change `alter: true` to `force: true` to reset tables
  .then(() => console.log("MySQL Database connected"))
  .catch((err) => console.error("Database error:", err));

app.listen(5000, () => console.log("Server running on port 5000"));
