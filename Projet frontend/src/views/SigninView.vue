<template>
  <div class="container mt-5">
    <h2 class="text-center">Connexion</h2>

    <form @submit.prevent="signin" class="mt-4">
      <div class="mb-3">
        <label for="login" class="form-label">Identifiant</label>
        <input id="login" v-model="login" type="text" class="form-control" />
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input
          id="password"
          v-model="password"
          type="password"
          class="form-control"
        />
      </div>

      <button type="submit" class="btn btn-primary w-100">Se connecter</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter, useRoute } from "vue-router";

import { useLoggedUserStore } from "../store/loggedUser";
const loggedUserStore = useLoggedUserStore();
const login = ref("");
const password = ref("");
const router = useRouter();
const route = useRoute();

async function signin() {
  let response = await fetch(`${import.meta.env.VITE_API_URL}/api/auth/login`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      identifier: login.value,
      password: password.value,
    }),
  });

  let json = await response.json();

  if (json.error) {
    alert(json.error);
    return;
  }

  if (json.token) {
    // localStorage.setItem('token', json.token)
    loggedUserStore.logIn(json);
    // Rediriger vers la page d'origine ou la page d'accueil
    const redirect = route.query.redirect || "/";
    router.push(redirect);
  }
}
</script>

<style scoped>
.container {
  max-width: 400px;
  margin: auto;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 8px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
</style>
