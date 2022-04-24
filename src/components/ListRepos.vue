<template>
  <div v-if="repos.length">
    <h2>Repositories list</h2>
    <ul>
      <li v-for="repo in repos" :key="repo.id" class="repo-item">
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
  padding: 0;
  margin: 0;
}

.repo-item {
  text-align: center;
  margin: .6em 0 .6em;
  padding: .3em;
  background-color: aqua;
}
</style>