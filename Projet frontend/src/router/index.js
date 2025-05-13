import { useLoggedUserStore } from "../store/loggedUser";
import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import SigninView from "../views/SigninView.vue";
import AdminDashboard from "../views/AdminDashboard.vue";
import Course from "../views/Course.vue";
import UsersList from "../views/UsersList.vue";
import RegisterView from "../views/RegisterView.vue";
import Quiz from "../components/Quiz.vue";
import TotalRecordes from "../components/TotalRecords.vue";
import CreateQuiz from "../views/CreateQuiz.vue";
import UnauthorizedView from "../views/UnauthorizedView.vue";
import LiveResults from "../components/LiveResults.vue";

const routes = [
  {
    path: "/create-quiz",
    name: "CreateQuiz",
    component: CreateQuiz,
    meta: { requiresAuth: true, requiresTrainer: true },
  },
  { path: "/", component: HomeView },
  { path: "/login", component: SigninView },
  {
    path: "/dashboard",
    component: AdminDashboard,
    meta: { requiresAdmin: true },
  },
  { path: "/register", component: RegisterView },
  { path: "/quiz", component: Quiz },
  { path: "/stats", component: TotalRecordes },
  { path: "/results", component: LiveResults },
  { path: "/users/list", name: "users-list", component: UsersList },
  { path: "/course/:id", component: Course },
  {
    path: "/users/change-password",
    name: "change-password",
    component: () => import("../views/ChangePassword.vue"),
  },
  {
    path: "/unauthorized",
    name: "unauthorized",
    component: UnauthorizedView,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const loggedUserStore = useLoggedUserStore();
  const publicPages = ["/login", "/register"];
  const authRequired = !publicPages.includes(to.path);
  const token = loggedUserStore.loggedUser?.token;
  const role = loggedUserStore.loggedUser?.role;

  if (authRequired && !token) {
    return next({ path: "/login", query: { redirect: to.fullPath } });
  }

  // Admin-only routes
  if (to.meta.requiresAdmin && role !== "admin") {
    return next("/unauthorized");
  }

  // Trainer or admin can access trainer routes
  if (to.meta.requiresTrainer && role !== "trainer" && role !== "admin") {
    return next("/unauthorized");
  }

  next();
});

export default router;
