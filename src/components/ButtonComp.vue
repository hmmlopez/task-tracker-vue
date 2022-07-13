<script setup lang="ts">
interface Props {
  text?: string;
  color?: string;
}
interface Emits {
  (event: "button-pressed"): void;
}

withDefaults(defineProps<Props>(), { color: "btn-primary" });
const emits = defineEmits<Emits>();

function onClick() {
  emits("button-pressed");
}
</script>

<template>
  <button type="button" :class="['btn', color]" @click="onClick()">{{ text }}</button>
</template>

<style scoped></style>
