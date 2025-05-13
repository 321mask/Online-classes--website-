import { createApp } from "vue";
import "./assets/main.css";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/js/bootstrap.min.js";
import App from "./App.vue";
import router from "./router"; // Ensure the path is correct
import { createPinia } from "pinia"; // If you are using Pinia for state management

const app = createApp(App);

// Use the router
app.use(router);

// Use Pinia if you are using it for state management
const pinia = createPinia();
app.use(pinia);

app.mount("#app");
