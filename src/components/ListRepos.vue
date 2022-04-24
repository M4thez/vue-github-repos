<template>
  <Transition name="fade">
    <div v-if="repos.length">
      <h2>{{ submittedUser }}'s public repositories list</h2>
      <ul class="repo-list">
        <li v-for="repo in repos" :key="repo.id">
          <p>{{ repo.name }}</p>
          <button @click="findLanguages(repo)">Expand</button>
          <Transition name="fade">
            <div v-if="selectedRepo === repo.name">
              <h3>Languages used</h3>
              <ul v-if="Object.keys(languages).length" class="lang-list">
                <li v-for="(value, lang) in languages" :key="lang">
                  {{ lang }} - {{ value }} Bytes
                </li>
              </ul>
              <p v-else>No data on languages</p>
            </div>
          </Transition>
        </li>
      </ul>
    </div>
    <div v-else-if="isSubmitted && repos.message === 'Not Found'">
      User "{{ submittedUser }}" doesn't exist
    </div>
    <div v-else-if="isSubmitted && !repos.length">
      User "{{ submittedUser }}" doesn't have any public repositories
    </div>
  </Transition>

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
.repo-list {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: inline-block;
}

.repo-list li {
  margin: .6em 0 .6em;
  padding: .2em 1em .8em;
  background-color: white;
  border-radius: .6em;
  /* TODO - add width */
}

.lang-list {
  list-style-type: disc;
  text-align: left;
}

/* Transition animation */
.fade-enter-active {
  transition: all 0.4s ease-in;
}

.fade-leave-active {
  transition: all 0.6s ease-out;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>