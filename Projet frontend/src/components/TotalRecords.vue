<script setup>
import { ref, onMounted, computed } from "vue";
import axios from "axios";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  ArcElement,
  CategoryScale,
  LinearScale,
} from "chart.js";
import { Bar, Pie } from "vue-chartjs";
import { useLoggedUserStore } from "../store/loggedUser";

// Register chart.js components
ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  ArcElement,
  CategoryScale,
  LinearScale
);

const totalUsers = ref(0);
const validatedUsers = ref(0);
const totalCourses = ref(0);
const totalQuizzes = ref(0);

const loggedUserStore = useLoggedUserStore();
const token = loggedUserStore.loggedUser?.token;

const fetchStats = async () => {
  try {
    const { data: userStats } = await axios.get(
      `${import.meta.env.VITE_API_URL}/api/stats/users`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
    const { data: courseStats } = await axios.get(
      `${import.meta.env.VITE_API_URL}/api/stats/courses`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
    const { data: quizStats } = await axios.get(
      `${import.meta.env.VITE_API_URL}/api/stats/quizzes`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );

    totalUsers.value = userStats.totalUsers;
    validatedUsers.value = userStats.validatedUsers;
    totalCourses.value = courseStats.totalCourses;
    totalQuizzes.value = quizStats.totalQuizzes;
  } catch (error) {
    console.error("Error fetching stats:", error);
  }
};

// Chart.js data and config
const barChartData = computed(() => ({
  labels: ["Users", "Validated", "Courses", "Quizzes"],
  datasets: [
    {
      label: "Platform Stats",
      data: [
        totalUsers.value,
        validatedUsers.value,
        totalCourses.value,
        totalQuizzes.value,
      ],
      backgroundColor: ["#4caf50", "#2196f3", "#ff9800", "#e91e63"],
    },
  ],
}));

const pieChartData = computed(() => ({
  labels: ["Validated Users", "Non-validated Users"],
  datasets: [
    {
      data: [validatedUsers.value, totalUsers.value - validatedUsers.value],
      backgroundColor: ["#4caf50", "#f44336"],
    },
  ],
}));

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
};

const successRate = computed(() => {
  return totalUsers.value
    ? Math.round((validatedUsers.value / totalUsers.value) * 100)
    : 0;
});

onMounted(fetchStats);
</script>

<template>
  <div class="dashboard">
    <h2>📊 Platform Statistics</h2>
    <div class="stats-grid">
      <div class="stat-card">
        <h3>Total Users</h3>
        <p>{{ totalUsers }}</p>
      </div>
      <div class="stat-card">
        <h3>Validated Users</h3>
        <p>{{ validatedUsers }}</p>
      </div>
      <div class="stat-card">
        <h3>Total Courses</h3>
        <p>{{ totalCourses }}</p>
      </div>
      <div class="stat-card">
        <h3>Total Quizzes</h3>
        <p>{{ totalQuizzes }}</p>
      </div>
      <div class="stat-card">
        <h3>Taux de Réussite</h3>
        <p>{{ successRate }}%</p>
      </div>
    </div>
    <div class="charts">
      <div class="chart-box">
        <Bar :data="barChartData" :options="chartOptions" />
      </div>
      <div class="chart-box">
        <Pie :data="pieChartData" :options="chartOptions" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.dashboard {
  max-width: 1000px;
  margin: 2rem auto;
  padding: 2rem;
}
.charts {
  display: flex;
  gap: 2rem;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 3rem;
}

.chart-box {
  width: 400px;
  height: 300px;
}

h2 {
  text-align: center;
  margin-bottom: 2rem;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
}

.stat-card {
  background-color: #f0f4f8;
  border-radius: 12px;
  padding: 2rem;
  text-align: center;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.stat-card h3 {
  margin-bottom: 1rem;
  color: #333;
}

.stat-card p {
  font-size: 2rem;
  font-weight: bold;
  color: #4caf50;
}
</style>
