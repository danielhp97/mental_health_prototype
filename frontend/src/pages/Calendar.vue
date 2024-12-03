<template>
  <div>
    <h1>Calendar</h1>
    <vue-cal :events="events" />
  </div>
</template>

<script>
import VueCal from "vue-cal";
import "vue-cal/dist/vuecal.css";

export default {
  components: { VueCal },
  data() {
    return {
      events: [
        { start: new Date(), end: new Date(), title: "Sample Event" },
      ],
    };
  },
};
</script>