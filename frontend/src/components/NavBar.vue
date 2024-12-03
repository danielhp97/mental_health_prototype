<template>
  <nav class="navbar">
    <ul>
      <li><router-link to="/">Home</router-link></li>
      <li><router-link to="/calendar">Calendar</router-link></li>
      <li><router-link to="/profile">Profile</router-link></li>
      <li><router-link to="/tasks">Tasks</router-link></li>
      <li><router-link to="/user-metrics">User Metrics</router-link></li>
      <li><router-link to="/general-metrics">General Metrics</router-link></li>
    </ul>
  </nav>
</template>

<style scoped>
.navbar {
  display: flex;
  background-color: #333;
  padding: 1rem;
}
.navbar ul {
  list-style: none;
  display: flex;
  gap: 1rem;
}
.navbar a {
  color: white;
  text-decoration: none;
}
</style>