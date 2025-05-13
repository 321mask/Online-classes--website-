<script setup>
import { ref, onMounted } from "vue";
import { useLoggedUserStore } from "../store/loggedUser";

const users = ref([]);
const courses = ref([]);
const loggedUserStore = useLoggedUserStore();
const token = loggedUserStore.loggedUser.token;

const fetchData = async () => {
  try {
    // Fetch users
    const userRes = await fetch(
      `${import.meta.env.VITE_API_URL}/api/admin/users`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      }
    );

    const userData = await userRes.json();
    users.value = Array.isArray(userData) ? userData : [userData];

    // Fetch courses
    const courseRes = await fetch(
      `${import.meta.env.VITE_API_URL}/api/admin/courses`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      }
    );

    const courseData = await courseRes.json();
    courses.value = courseData;

    console.log("Fetched users:", userData);
  } catch (error) {
    console.error("Error fetching data:", error);
    alert("Error fetching data. Please try again later.");
  }
};

const approveUser = async (id) => {
  try {
    const response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/admin/users/${id}/approve`,
      {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      }
    );

    const result = await response.json();

    if (!response.ok) {
      throw new Error(result.error || "Failed to approve user");
    }

    fetchData();
  } catch (error) {
    console.error("Error approving user:", error);
    alert("Failed to approve user.");
  }
};

const deleteUser = async (id) => {
  try {
    const response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/admin/users/${id}`,
      {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    if (!response.ok) {
      const result = await response.json();
      throw new Error(result.error || "Failed to delete user");
    }

    fetchData();
  } catch (error) {
    console.error("Error deleting user:", error);
    alert("Failed to delete user.");
  }
};

const deleteCourse = async (id) => {
  try {
    const response = await fetch(
      `${import.meta.env.VITE_API_URL}/api/admin/courses/${id}`,
      {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    if (!response.ok) {
      const result = await response.json();
      throw new Error(result.error || "Failed to delete course");
    }

    fetchData();
  } catch (error) {
    console.error("Error deleting course:", error);
    alert("Failed to delete course.");
  }
};

onMounted(fetchData);
</script>

<template>
  <div>
    <h2>Admin Dashboard</h2>

    <h3>Users</h3>
    <table>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Validation</th>
        <th>Actions</th>
      </tr>
      <tr v-for="user in users" :key="user.id">
        <td>{{ user.name }}</td>
        <td>{{ user.email }}</td>
        <td>{{ user.role }}</td>
        <td>
          {{ user.validated ? "Validated" : "Not Validated" }}
        </td>
        <td>
          <button v-if="!user.validated" @click="approveUser(user.id)">
            Approve
          </button>
          <button @click="deleteUser(user.id)">Delete</button>
        </td>
      </tr>
    </table>

    <h3>Courses</h3>
    <table>
      <tr>
        <th>Title</th>
        <th>Trainer</th>
        <th>Actions</th>
      </tr>
      <tr v-for="course in courses" :key="course.id">
        <td>{{ course.title }}</td>
        <td>{{ course.trainerId }}</td>
        <td><button @click="deleteCourse(course.id)">Delete</button></td>
      </tr>
    </table>
  </div>
</template>
