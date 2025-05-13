<script setup>
import { ref } from "vue";
import { useLoggedUserStore } from "../store/loggedUser";
import axios from "axios";
import { useAuthStore } from "../store/auth";
import { useRouter } from "vue-router";
import { QuillEditor } from "@vueup/vue-quill";
import "quill/dist/quill.snow.css";

const authStore = useAuthStore();
const router = useRouter();
const title = ref("");
const description = ref("");
const content = ref("");
const files = ref(null);

const submitCourse = async () => {
  const formData = new FormData();
  formData.append("title", title.value);
  formData.append("description", description.value);
  formData.append("content", content.value);
  const files = ref([]);
  if (files.value && files.value.length) {
    for (const file of files.value) {
      formData.append("files", file);
    }
  }
  const loggedUserStore = useLoggedUserStore();
  const token = loggedUserStore.loggedUser?.token;

  await axios.post("http://localhost:8000/api/courses", formData, {
    headers: { Authorization: `Bearer ${token}` },
  });

  router.push("/dashboard");
};
</script>

<template>
  <div>
    <h2>Create Course</h2>
    <input v-model="title" placeholder="Course Title" />
    <textarea v-model="description" placeholder="Course Description"></textarea>

    <quill-editor v-model="content"></quill-editor>

    <input type="file" multiple @change="files = $event.target.files" />

    <button @click="submitCourse">Submit</button>
  </div>
</template>
