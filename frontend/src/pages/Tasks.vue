<template>
  <div>
    <h1>Tasks</h1>
    <ul>
      <li v-for="(task, index) in tasks" :key="index">
        {{ task.name }} - {{ task.status }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tasks: [
        { name: "Task 1", status: "In Progress" },
        { name: "Task 2", status: "Completed" },
      ],
    };
  },
};
</script>