<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { io } from "socket.io-client";
import axios from "axios";
import { useLoggedUserStore } from "../store/loggedUser";

const results = ref([]);
const socket = io("http://localhost:8000");
const loggedUserStore = useLoggedUserStore();
const token = loggedUserStore.loggedUser.token;

onMounted(() => {
  // Listen for the 'quizResults' event from the server
  socket.on("quizResults", (data) => {
    console.log("Received quiz result:", data);
    results.value.push(data); // Store the result in the results array
  });
  fetchAnswers();
});

// Clean up socket connection when component is unmounted
onUnmounted(() => {
  socket.disconnect();
});

const fetchAnswers = async () => {
  try {
    const { data } = await axios.get(
      `${import.meta.env.VITE_API_URL}/api/stats/quizzes`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );

    results.value = data.results;
  } catch (error) {
    console.error("Failed to fetch answers:", error);
    alert("Error fetching quiz answers.");
  }
};
</script>

<template>
  <div>
    <h2>Live Quiz Results</h2>
    <ul>
      <li v-for="(result, index) in results" :key="index">
        <strong>{{ result.user }}</strong> answered
        <em>"{{ result.question }}"</em> —
        <span :style="{ color: result.isCorrect ? 'green' : 'red' }">
          {{ result.isCorrect ? "Correct" : "Incorrect" }}
        </span>
      </li>
    </ul>
  </div>
</template>
