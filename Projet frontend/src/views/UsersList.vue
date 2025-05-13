<template>
  <div class="container mt-5">
    <h2 class="text-center">User List</h2>

    <h3>{{ user.name }}</h3>
    <p>{{ user.email }}</p>
    <p>{{ user.role }}</p>
    <p>{{ user.validated ? "Validated" : "Not Validated" }}</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useLoggedUserStore } from "../store/loggedUser";

const user = ref({});
const loggedUserStore = useLoggedUserStore();
const userId = loggedUserStore.loggedUser.id;

const fetchUsers = async () => {
  try {
    const token = loggedUserStore.loggedUser.token;
    const response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/users/${userId}`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      }
    );
    const data = await response.json();
    if (data.error) {
      alert(data.error);
      return;
    }
    user.value = data;
  } catch (error) {
    console.error("Error fetching users:", error);
    alert("An error occurred while fetching users. Please try again.");
  }
};

onMounted(() => {
  fetchUsers();
});
</script>

<style scoped>
.container {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 8px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.user-card {
  border: 1px solid #ddd;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 4px;
}
</style>
