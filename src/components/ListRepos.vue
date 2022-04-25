<template>
  <!-- Repositories list -->
  <Transition name="fade">
    <div v-if="repos.length">
      <h2>{{ submittedUser }}'s public repositories list</h2>
      <ul class="repo-list">
        <li v-for="repo in repos" :key="repo.id">
          <p><a :href="repo.html_url">{{ repo.name }}</a></p>
          <button @click="findLanguages(repo)" class="button">Details</button>
          <!-- Language list -->
          <Transition name="fade">
            <div v-if="selectedRepo === repo.name">
              <h3>Languages used</h3>
              <ul v-if="Object.keys(languages).length" class="lang-list">
                <li v-for="(value, lang) in languages" :key="lang">
                  {{ lang }} - {{ value }} Bytes
                </li>
              </ul>
              <p v-else>No data on languages in this repo</p>
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
a {
  text-decoration: none;
  color: #2c3e50;
  font-size: 1.5em;
  padding: .2em .6em;
  background-color: #f4f4f4;
  border-radius: .2em;
}

a:hover {
  color: #577797;
}

/* Repositories list */
.repo-list {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: inline-block;
  width: 40%;
}

.repo-list li {
  margin: .6em 0 1em;
  padding: .2em 1em .8em;
  background-color: white;
  border-radius: .3em;
}

/* Languages list */
.lang-list {
  list-style-type: disc;
  text-align: left;
  display: inline-block;
}

/* Transition animation */
.fade-enter-active,
.fade-leave-active {
  transition: all .8s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: translateY(20%);
}

@media (max-width:1200px) {
  .repo-list {
    width: 60%;
  }
}

@media (max-width:600px) {
  .repo-list {
    width: 80%;
  }
}

@media (max-width:480px) {
  .repo-list {
    width: 90%;
  }
}
</style>