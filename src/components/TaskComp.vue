<script setup lang="ts">
import type Task from "@/types/Task";
import ButtonComp from "./ButtonComp.vue";
interface Props {
  task: Task;
}
interface Emits {
  (event: "delete-task", id: string): void;
  (event: "toggle-reminder", id: string): void;
}
defineProps<Props>();
defineEmits<Emits>();
</script>

<template>
  <div
    :class="['task', task.reminder ? 'reminder' : '']"
    @dblclick="$emit('toggle-reminder', task.id)"
  >
    <h3>
      {{ task.text
      }}<ButtonComp color="btn-close" @button-pressed="$emit('delete-task', task.id)" />
    </h3>
    <p>{{ task.day }}</p>
  </div>
</template>

<style scoped>
.task {
  background: #f4f4f4;
  margin: 5px;
  padding: 10px 20px;
  cursor: pointer;
}
.task.reminder {
  border-left: 5px solid green;
}
.task h3 {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
