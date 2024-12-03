<template>
  <div class="notifications-bar">
    <p v-for="(notification, index) in notifications" :key="index">
      {{ notification }}
    </p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      notifications: ["Welcome to the app!", "You have new tasks assigned."],
    };
  },
};
</script>

<style scoped>
.notifications-bar {
  background-color: #f4f4f4;
  padding: 1rem;
  border-bottom: 1px solid #ddd;
}
</style>