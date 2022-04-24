<template>
  <div v-if="repos.length">
    <h2>Repositories list</h2>
    <ul>
      <li v-for="repo in repos" :key="repo.id">
        <p>{{ repo.name }}</p>
      </li>
    </ul>
  </div>
  <div v-else-if="isSubmitted && repos.message === 'Not Found'">
    User "{{ submittedUsername }}" doesn't exist
  </div>
  <div v-else-if="isSubmitted && !repos.length">
    User "{{ submittedUsername }}" doesn't have any public repositories
  </div>

</template>

<script>
export default {
  props: {
    repos: Object,
    isSubmitted: Boolean,
    submittedUsername: String,
  }
}
</script>

<style scoped>
ul {
  list-style-type: none;
  padding: none;
}
</style>