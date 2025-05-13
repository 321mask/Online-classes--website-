<template>
  <div class="container mt-5">
    <h2 class="text-center">Inscription</h2>

    <form @submit.prevent="register" class="mt-4">
      <div class="mb-3">
        <label for="name" class="form-label">Nom</label>
        <input id="name" v-model="name" type="text" class="form-control" />
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input id="email" v-model="email" type="email" class="form-control" />
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

      <div class="mb-3">
        <label for="role" class="form-label">Rôle</label>
        <select id="role" v-model="role" class="form-control">
          <option value="student">Étudiant</option>
          <option value="trainer">Enseignant</option>
          <option value="admin">Admin</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const name = ref("");
const email = ref("");
const password = ref("");
const role = ref("");
const router = useRouter();

async function register() {
  try {
    let response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/auth/register`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: name.value,
          email: email.value,
          password: password.value,
          role: role.value,
        }),
      }
    );

    let json = await response.json();

    if (json.error) {
      alert(json.error);
      return;
    }

    if (json.token) {
      if (role.value === "student") {
        alert(
          "Votre compte a été créé et est en attente de validation par un enseignant."
        );
      } else {
        alert("Inscription réussie !");
      }
      router.push("/login");
    }
  } catch (error) {
    console.error("Error during registration:", error);
    alert("An error occurred during registration. Please try again.");
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
