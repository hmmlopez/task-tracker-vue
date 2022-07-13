<script setup lang="ts">
import { ref } from "vue";
import HeaderComp from "./components/HeaderComp.vue";
import FooterComp from "./components/FooterComp.vue";

const showAddTask = ref<boolean>(false);
</script>

<template>
  <div class="container border">
    <HeaderComp
      title="Task Tracker"
      @toggle-add-task="showAddTask = !showAddTask"
      :show-add-task="showAddTask"
    />
    <RouterView :showAddTask="showAddTask" />
    <FooterComp />
  </div>
</template>

<style></style>
