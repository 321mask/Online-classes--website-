import { ref } from "vue";
import { defineStore } from "pinia";

export const useLoggedUserStore = defineStore("loggedUser", () => {
  const loggedUser = ref({});
  if (localStorage.getItem("loggedUser")) {
    loggedUser.value = JSON.parse(localStorage.getItem("loggedUser"));
  }
  console.log("🚀 ~ useLoggedUserStore ~ loggedUser:", loggedUser);
  function logIn(u) {
    loggedUser.value = u;
    localStorage.setItem("loggedUser", JSON.stringify(u));
  }
  function logOut() {
    loggedUser.value = {};
    localStorage.removeItem("loggedUser");
  }

  return { loggedUser, logIn, logOut };
});
