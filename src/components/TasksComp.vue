<script setup lang="ts">
import type Task from "@/types/Task";
import TaskComp from "./TaskComp.vue";
interface Props {
  tasks: Task[];
}
interface Emits {
  (event: "delete-task", id: string): void;
  (event: "toggle-reminder", id: string): void;
}
defineProps<Props>();

defineEmits<Emits>();
</script>

<template>
  <div v-for="task in tasks" :key="task.id">
    <TaskComp
      :task="task"
      @delete-task="$emit('delete-task', task.id)"
      @toggle-reminder="$emit('toggle-reminder', task.id)"
    />
  </div>
</template>

<style scoped></style>
