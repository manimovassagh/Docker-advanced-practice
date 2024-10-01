<template>
  <div>
    <h1>{{ title }}</h1>
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
defineProps<{
  title: string
  message: string
}>()
</script>

<style scoped>

</style>

