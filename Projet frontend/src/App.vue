<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <RouterLink class="navbar-brand" to="/">MyApp</RouterLink>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <RouterLink class="nav-link" to="/">Home</RouterLink>
            </li>
          </ul>
          <h1
            v-if="loggedUserStore.loggedUser"
            class="btn btn-primary"
            @click="viewUser"
          >
            {{ loggedUserStore.loggedUser.name }}
          </h1>
          <RouterLink to="/users/change-password" class="btn btn-warning me-2">
            Changer mot de passe
          </RouterLink>
          <button class="btn btn-danger" @click="signout">
            Se déconnecter
          </button>
        </div>
      </div>
    </nav>

    <div class="container text-center mt-4">
      <div class="d-flex justify-content-center gap-3">
        <RouterLink to="/quiz" class="btn btn-primary">Quiz</RouterLink>
        <Router-link to="/create-quiz" class="btn btn-primary"
          >Create Quiz</Router-link
        >
        <RouterLink to="/stats" class="btn btn-primary">Stats</RouterLink>
        <RouterLink to="/results" class="btn btn-primary"
          >Quiz results</RouterLink
        >
        <RouterLink :to="`/course/${courseId}`" class="btn btn-secondary">
          Gérer les cours
        </RouterLink>
        <RouterLink
          v-if="
            loggedUserStore.loggedUser &&
            loggedUserStore.loggedUser.role === 'trainer'
          "
          to="/dashboard"
          class="btn btn-success"
        >
          Admin dashboard
        </RouterLink>
        <RouterLink to="/register" class="btn btn-info">
          Créer un utilisateur
        </RouterLink>
      </div>
    </div>
  </header>

  <main class="container mt-4">
    <RouterView />
  </main>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { RouterLink, RouterView, useRouter } from "vue-router";
import { useLoggedUserStore } from "./store/loggedUser";

const loggedUserStore = useLoggedUserStore();
const router = useRouter();
const courseId = ref(1); // Replace with the actual course ID logic

const viewUser = () => {
  router.push("/users/list");
};

const signout = () => {
  loggedUserStore.logOut();
  router.push("/login");
};

let ws;
const initWebSocket = () => {
  ws = new WebSocket("ws://localhost:8081");
  ws.onopen = () => {
    console.log("WebSocket connected");
  };
  ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    // Handle real-time updates here
    // For example, update the users list
    users.value = data;
  };
  ws.onerror = (error) => {
    console.error("WebSocket error:", error);
  };
  ws.onclose = () => {
    console.log("WebSocket disconnected");
  };
};

onMounted(() => {
  initWebSocket();
});

onUnmounted(() => {
  if (ws) {
    ws.close();
  }
});
</script>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

.container {
  text-align: center;
}

.d-flex {
  display: flex;
  justify-content: center;
  gap: 1rem;
}
</style>
