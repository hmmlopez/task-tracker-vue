<script setup lang="ts">
import ButtonComp from "./ButtonComp.vue";

withDefaults(defineProps<{ title?: string; showAddTask: boolean }>(), { title: "Hello World" });
defineEmits<{ (event: "toggle-add-task"): void }>();
</script>

<template>
  <header>
    <h1>{{ title }}</h1>
    <ButtonComp
      v-show="$route.name === 'home'"
      :text="showAddTask ? 'Close' : 'Add Task'"
      :color="showAddTask ? 'btn-danger' : 'btn-success'"
      @button-pressed="$emit('toggle-add-task')"
    />
  </header>
</template>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
</style>
