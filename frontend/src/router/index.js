import { createRouter, createWebHistory } from "vue-router";
import Home from "../pages/Home.vue";
import Calendar from "../pages/Calendar.vue";
import Profile from "../pages/Profile.vue";
import Tasks from "../pages/Tasks.vue";
import UserMetrics from "../pages/UserMetrics.vue";
import GeneralMetrics from "../pages/GeneralMetrics.vue";

const routes = [
  { path: "/", name: "Home", component: Home },
  { path: "/calendar", name: "Calendar", component: Calendar },
  { path: "/profile", name: "Profile", component: Profile },
  { path: "/tasks", name: "Tasks", component: Tasks },
  { path: "/user-metrics", name: "UserMetrics", component: UserMetrics },
  { path: "/general-metrics", name: "GeneralMetrics", component: GeneralMetrics },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;