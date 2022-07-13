<script setup lang="ts">
import { ref } from "vue";
import TasksComp from "../components/TasksComp.vue";
import type Task from "../types/Task";
import AddTaskComp from "../components/AddTaskComp.vue";

defineProps<{ showAddTask: boolean }>();
const tasks = ref<Task[]>([]);

async function fetchTask(id: string) {
  const res = await fetch(`api/tasks/${id}`);
  const data = await res.json();
  return data;
}

async function addTask(task: Task) {
  const res = await fetch("api/tasks", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(task),
  });
  const data = await res.json();

  tasks.value = [...tasks.value, data];
}

async function deleteTask(id: string) {
  if (confirm("Are you sure?")) {
    const res = await fetch(`api/tasks/${id}`, {
      method: "DELETE",
    });

    res.status === 200
      ? (tasks.value = tasks.value.filter((task) => task.id !== id))
      : alert("Error deleting task");
  }
}

async function toggleReminder(id: string) {
  const taskToToggle = await fetchTask(id);
  const updatedTask = { ...taskToToggle, reminder: !taskToToggle.reminder };

  const res = await fetch(`api/tasks/${id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(updatedTask),
  });
  const data = await res.json();

  tasks.value = tasks.value.map((task) =>
    task.id === id ? { ...task, reminder: data.reminder } : task
  );
}

async function fetchTasks() {
  const res = await fetch("api/tasks");
  const data = await res.json();
  tasks.value = data;
}

fetchTasks();
</script>

<template>
  <main>
    <AddTaskComp v-if="showAddTask" @add-task="addTask" />
    <TasksComp :tasks="tasks" @delete-task="deleteTask" @toggle-reminder="toggleReminder" />
  </main>
</template>
