import { defineStore } from "pinia";
import axios from "axios";

export const useAuthStore = defineStore("auth", {
  state: () => ({
    user: null,
    token: localStorage.getItem("token") || null,
  }),
  actions: {
    async login(credentials) {
      const { data } = await axios.post("/api/auth/login", credentials);
      this.user = data.user;
      this.token = data.token;
      localStorage.setItem("token", data.token);
    },
    logout() {
      this.user = null;
      this.token = null;
      localStorage.removeItem("token");
    },
  },
});
