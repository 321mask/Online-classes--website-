<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useLoggedUserStore } from "../store/loggedUser";

const loggedUserStore = useLoggedUserStore();

const router = useRouter();
const oldPassword = ref("");
const newPassword = ref("");
const confirmPassword = ref("");
const error = ref("");

async function updatePassword() {
  if (newPassword.value !== confirmPassword.value) {
    error.value = "Les nouveaux mots de passe ne correspondent pas.";
    return;
  }

  try {
    let response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/change-password`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: loggedUserStore.loggedUser.token,
        },
        body: JSON.stringify({
          oldPassword: oldPassword.value,
          newPassword: newPassword.value,
        }),
      }
    );

    let json = await response.json();
    if (json.error) {
      error.value = json.error;
      return;
    }

    alert("Mot de passe mis à jour avec succès!");
    router.push("/");
  } catch (err) {
    console.error(err);
    error.value = "Erreur lors de la mise à jour du mot de passe.";
  }
}
</script>

<template>
  <div class="container mt-4">
    <h1>Changer le mot de passe</h1>

    <div v-if="error" class="alert alert-danger">{{ error }}</div>

    <form @submit.prevent="updatePassword">
      <div class="mb-3">
        <label class="form-label">Ancien mot de passe</label>
        <input
          type="password"
          v-model="oldPassword"
          class="form-control"
          required
        />
      </div>

      <div class="mb-3">
        <label class="form-label">Nouveau mot de passe</label>
        <input
          type="password"
          v-model="newPassword"
          class="form-control"
          required
        />
      </div>

      <div class="mb-3">
        <label class="form-label">Confirmer le mot de passe</label>
        <input
          type="password"
          v-model="confirmPassword"
          class="form-control"
          required
        />
      </div>

      <button type="submit" class="btn btn-primary">Mettre à jour</button>
    </form>
  </div>
</template>
