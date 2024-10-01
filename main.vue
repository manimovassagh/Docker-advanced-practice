<template>
  <div>
    <h1>{{ title }}</h1>
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
export default {
  props: {
    title: {
      type: String,
      required: true
    },
    message: {
      type: String,
      required: true
    }
  }
}
</script>

<style scoped>

</style>

