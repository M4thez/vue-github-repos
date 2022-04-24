<template>
  <div v-if="repos.length">
    <h2>{{ submittedUser }}'s public repositories list</h2>
    <ul>
      <li v-for="repo in repos" :key="repo.id" class="repo-item">
        <p>{{ repo.name }}</p>
        <button @click="findLanguages(repo)">Expand</button>
        <div v-if="selectedRepo === repo.name">
          <h3>Languages used</h3>
          <ul v-if="Object.keys(languages).length">
            <li v-for="(value, lang) in languages" :key="lang">
              {{ lang }} - {{ value }} Bytes
            </li>
          </ul>
          <p v-else>No data on languages</p>
        </div>
      </li>
    </ul>
  </div>
  <div v-else-if="isSubmitted && repos.message === 'Not Found'">
    User "{{ submittedUser }}" doesn't exist
  </div>
  <div v-else-if="isSubmitted && !repos.length">
    User "{{ submittedUser }}" doesn't have any public repositories
  </div>

</template>

<script>
export default {
  props: {
    repos: Object,
    isSubmitted: Boolean,
    submittedUser: String,
  },
  data() {
    return {
      languages: {},
      selectedRepo: "",
    };
  },
  methods: {
    findLanguages(repo) {
      fetch(`https://api.github.com/repos/${this.submittedUser}/${repo.name}/languages`)
        .then(response => response.json())
        .then(data => {
          this.languages = data;
          this.selectedRepo = repo.name;
        })
        .catch(error => console.log(error.message));
    }
  },

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
  background-color: white;
}
</style>