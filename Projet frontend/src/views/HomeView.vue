<script setup>
import { ref, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";

const router = useRouter();
const route = useRoute();

let welcomeMessage = ref(
  "Bienvenue sur notre plateforme de formation en ligne !"
);
</script>

<template>
  <div class="container mt-4 text-center">
    <h1>{{ welcomeMessage }}</h1>
  </div>
</template>
