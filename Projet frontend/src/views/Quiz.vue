<template>
  <div class="quiz-container">
    <h2>Quiz</h2>

    <div v-if="currentQuestionIndex < questions.length">
      <p class="question">
        {{ currentQuestionIndex + 1 }}.
        {{ questions[currentQuestionIndex].question }}
      </p>

      <div class="options">
        <label
          v-for="(option, index) in questions[currentQuestionIndex].options"
          :key="index"
        >
          <input
            type="radio"
            :value="option"
            v-model="selectedAnswer"
            name="quiz-option"
          />
          {{ option }}
        </label>
      </div>

      <button @click="submitAnswer" :disabled="!selectedAnswer">Next</button>
    </div>

    <div v-else class="result">
      <h3>Quiz Finished!</h3>
      <p>You scored {{ score }} out of {{ questions.length }}</p>
      <button @click="resetQuiz">Retake Quiz</button>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";

const questions = [
  {
    question: "What is the capital of France?",
    options: ["Paris", "London", "Berlin", "Madrid"],
    correctAnswer: "Paris",
  },
  {
    question: "Which planet is known as the Red Planet?",
    options: ["Earth", "Venus", "Mars", "Jupiter"],
    correctAnswer: "Mars",
  },
  {
    question: "Who wrote 'Romeo and Juliet'?",
    options: ["Shakespeare", "Hemingway", "Tolkien", "Dickens"],
    correctAnswer: "Shakespeare",
  },
];

const currentQuestionIndex = ref(0);
const selectedAnswer = ref(null);
const score = ref(0);

function submitAnswer() {
  if (
    selectedAnswer.value === questions[currentQuestionIndex.value].correctAnswer
  ) {
    score.value++;
  }

  selectedAnswer.value = null;
  currentQuestionIndex.value++;
}

function resetQuiz() {
  currentQuestionIndex.value = 0;
  selectedAnswer.value = null;
  score.value = 0;
}
</script>

<style scoped>
.quiz-container {
  max-width: 500px;
  margin: 30px auto;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.question {
  font-size: 1.2rem;
  margin-bottom: 10px;
}

.options {
  margin-bottom: 20px;
}

.options label {
  display: block;
  margin: 5px 0;
}

.result {
  text-align: center;
}
</style>
