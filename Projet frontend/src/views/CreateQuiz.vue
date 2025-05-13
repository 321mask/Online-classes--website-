<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { useLoggedUserStore } from "../store/loggedUser";

const question = ref("");
const options = ref(["", "", "", ""]);
const correctAnswer = ref("");
const courseId = ref("");
const courses = ref([]);
const loggedUserStore = useLoggedUserStore();

const fetchCourses = async () => {
  const token = loggedUserStore.loggedUser.token;
  const { data } = await axios.get(
    `${import.meta.env.VITE_API_URL}/api/admin/courses`,
    {
      headers: { Authorization: `Bearer ${token}` },
    }
  );
  console.log(data);
  courses.value = data;
};

const createQuiz = async () => {
  const token = loggedUserStore.loggedUser.token;

  await axios.post(
    `${import.meta.env.VITE_API_URL}/api/quiz`,
    {
      courseId: courseId.value,
      question: question.value,
      options: options.value,
      correctAnswer: correctAnswer.value,
    },
    {
      headers: { Authorization: `Bearer ${token}` },
    }
  );

  alert("Quiz created!");
  question.value = "";
  options.value = ["", "", "", ""];
  correctAnswer.value = "";
};

onMounted(fetchCourses);
</script>

<template>
  <div>
    <h2>Create a Quiz</h2>

    <label>Course</label>
    <select v-model="courseId">
      <option v-for="course in courses" :value="course.id" :key="course.id">
        {{ course.title }}
      </option>
    </select>

    <label>Question</label>
    <input v-model="question" />

    <div v-for="(opt, index) in options" :key="index">
      <label>Option {{ index + 1 }}</label>
      <input v-model="options[index]" />
    </div>

    <label>Correct Answer</label>
    <input v-model="correctAnswer" />

    <button @click="createQuiz">Submit</button>
  </div>
</template>
