import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import http from "http";
import { WebSocketServer } from "ws";
import { Server } from "socket.io";
import mysql from "mysql2";
import authRoutes from "./routes/auth.js";
import adminRoutes from "./routes/admin.js";
import userRoutes from "./routes/user.js";
import courseRoutes from "./routes/course.js";
import quizRoutes from "./routes/quiz.js";
import statsRoutes from "./routes/stats.js";
import sequelize from "./config/db.js";
import router from "./routes/changePass.js";
import applyAssociations from "./models/associations.js";

// Load env variables
dotenv.config();

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

db.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err);
  } else {
    console.log("✅ Connected to MySQL!");
  }
});

const app = express();
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: "*" } });
export { io };

// Socket.io setup
io.on("connection", (socket) => {
  console.log("🟢 User connected:", socket.id);

  socket.on("quizSubmitted", (data) => {
    io.emit("quizResults", data);
  });

  socket.on("disconnect", () => console.log("🔴 User disconnected"));
});

// WebSocket (ws) setup (uses port 8081 to avoid conflict with express)
const wss = new WebSocketServer({ port: 8081 });
wss.on("connection", (ws) => {
  ws.on("error", console.error);
  ws.on("message", (data) => {
    const parsedData = JSON.parse(data.toString());
    wss.clients.forEach((client) => {
      if (client.readyState === WebSocket.OPEN) {
        client.send(JSON.stringify(parsedData));
      }
    });
  });
});

// Middleware
app.use(express.json());
app.use(cors());

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/admin", adminRoutes);
app.use("/api/users", userRoutes);
app.use("/api/courses", courseRoutes);
app.use("/api/quiz", quizRoutes);
app.use("/api/stats", statsRoutes);
app.use("/api", router);

applyAssociations();
sequelize
  .sync({ alter: true }) // Change `alter: true` to `force: true` to reset tables
  .then(() => console.log("MySQL Database connected"))
  .catch((err) => console.error("Database error:", err));

// Start server
const PORT = process.env.PORT || 8000;
server.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`));
