<script setup lang="ts">
import type Task from "@/types/Task";
import { ref } from "vue";
import ButtonComp from "./ButtonComp.vue";

const emits = defineEmits<{ (event: "add-task", newTask: Task): void }>();
const text = ref<string>("");
const day = ref<string>("");
const reminder = ref<boolean>(false);

function onSubmit(event: Event) {
  event.preventDefault();
  if (!text.value) {
    alert("Please add a task");
    return;
  }
  const newTask: Task = {
    // id: Math.floor(Math.random() * 100_000).toString(),
    text: text.value,
    day: day.value,
    reminder: reminder.value,
  };

  text.value = "";
  day.value = "";
  reminder.value = false;

  emits("add-task", newTask);
}
</script>

<template>
  <div class="row">
    <div class="col-4">
      <form @submit="onSubmit" class="add-form">
        <div class="form-control">
          <label>Task</label>
          <input type="text" v-model="text" name="text" placeholder="Add Task" />
        </div>
        <div class="form-control">
          <label>Day & Time</label>
          <input type="text" v-model="day" name="day" placeholder="Add Day & Time" />
        </div>
        <div class="form-control form-control-check">
          <label>Set Reminder</label>
          <input type="checkbox" v-model="reminder" name="reminder" />
        </div>

        <ButtonComp type="submit" text="Save Task" color="btn-success mb-4" />
      </form>
    </div>
  </div>
</template>

<style scoped></style>
