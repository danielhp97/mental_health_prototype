<template>
  <div>
    <NotificationsBar />
    <Navbar />
    <router-view />
  </div>
</template>

<script>
import Navbar from "./components/Navbar.vue";
import NotificationsBar from "./components/NotificationsBar.vue";

export default {
  components: { Navbar, NotificationsBar },
};
</script>