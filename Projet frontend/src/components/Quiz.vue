<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { useLoggedUserStore } from "../store/loggedUser";

const quizzes = ref([]);
const userAnswers = ref({});
const loggedUserStore = useLoggedUserStore();
const token = loggedUserStore.loggedUser.token;
const isSubmitting = ref(false);
const feedbackMessage = ref("");
const certificateUrl = ref("");

// Fetch quizzes from API
const fetchQuizzes = async () => {
  try {
    const { data } = await axios.get(
      `${import.meta.env.VITE_API_URL}/api/quiz`,
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
    quizzes.value = data;
  } catch (error) {
    console.error("Failed to fetch quizzes:", error);
    alert("Error fetching quiz questions.");
  }
};

// Submit answers to API
const submitAnswers = async () => {
  isSubmitting.value = true;
  try {
    const { data } = await axios.post(
      `${import.meta.env.VITE_API_URL}/api/quiz/submit`,
      {
        answers: userAnswers.value,
      },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
    alert(`Your score: ${data.score}, ${data.feedbackMessage}`);
    feedbackMessage.value = data.feedbackMessage;
    certificateUrl.value = data.certificateUrl || "";
    userAnswers.value = {}; // Reset after submit
  } catch (error) {
    console.error("Failed to submit answers:", error);
    alert("Error submitting your answers.");
  } finally {
    isSubmitting.value = false;
  }
};

// Run on component mount
onMounted(fetchQuizzes);
</script>

<template>
  <div class="quiz-container">
    <h2>Quiz</h2>

    <div v-for="quiz in quizzes" :key="quiz.id" class="quiz-question">
      <p>{{ quiz.question }}</p>
      <div v-for="option in quiz.options" :key="option">
        <label>
          <input
            type="radio"
            :name="quiz.id"
            :value="option"
            v-model="userAnswers[quiz.id]"
          />
          {{ option }}
        </label>
      </div>
    </div>

    <button
      class="submit-btn"
      @click="submitAnswers"
      :disabled="
        Object.keys(userAnswers).length !== quizzes.length || isSubmitting
      "
    >
      <span v-if="isSubmitting">
        <span class="spinner"></span> Submitting...
      </span>
      <span v-else> Submit Quiz </span>
    </button>
  </div>
  <div v-if="feedbackMessage" class="feedback">
    <p>{{ feedbackMessage }}</p>
  </div>
  <div v-if="certificateUrl" class="certificate">
    🎉 Félicitations ! Vous avez obtenu un certificat :
    <a :href="certificateUrl" target="_blank" rel="noopener"
      >Voir le certificat</a
    >
  </div>
</template>

<style scoped>
.quiz-container {
  max-width: 600px;
  margin: 2rem auto;
  padding: 2rem;
  background-color: #f9f9f9;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 2rem;
}

.quiz-question {
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #ddd;
}

p {
  font-weight: 600;
  margin-bottom: 0.5rem;
}

label {
  display: block;
  margin: 0.3rem 0;
}

.submit-btn {
  display: block;
  margin: 2rem auto 0;
  padding: 0.6rem 1.5rem;
  background-color: #4caf50;
  color: white;
  font-weight: bold;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: 0.2s ease-in-out;
}

.submit-btn:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.submit-btn:hover:enabled {
  background-color: #45a049;
}

.spinner {
  display: inline-block;
  width: 16px;
  height: 16px;
  border: 2px solid rgba(255, 255, 255, 0.6);
  border-radius: 50%;
  border-top-color: white;
  animation: spin 1s ease-in-out infinite;
  margin-right: 8px;
}

.feedback {
  margin-top: 1rem;
  padding: 1rem;
  background-color: #e7f3fe;
  border-left: 4px solid #2196f3;
  color: #0b72b9;
  border-radius: 6px;
}

.certificate {
  margin-top: 1rem;
  padding: 1rem;
  background-color: #d4edda;
  border-left: 4px solid #28a745;
  color: #155724;
  border-radius: 6px;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
</style>
