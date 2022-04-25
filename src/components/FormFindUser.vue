<template>
  <form @submit="findUser">
    <label for="name">Find GitHub user public repositories</label><br />
    <input type="text" v-model="user" name="user" placeholder="Find a user" /><br />
    <input type="submit" value="Search" class="button" />
  </form>
  <ListRepos :repos="repos" :is-submitted="isSubmitted" :submitted-user="submittedUser" />
</template>

<script>
import ListRepos from "./ListRepos.vue";
export default {
  components: {
    ListRepos,
  },
  data() {
    return {
      user: "",
      repos: [],
      isSubmitted: false,
      submittedUser: "",
    };
  },
  methods: {
    findUser(e) {
      e.preventDefault();
      this.submittedUser = this.user;
      fetch(`https://api.github.com/users/${this.submittedUser}/repos`)
        .then(response => response.json())
        .then(data => {
          this.repos = data;
          this.isSubmitted = true;
        })
        .catch(error => console.log(error.message));
    }
  },
};
</script>

<style scoped>
input[type="text"] {
  width: 40%;
  padding: .6em;
  margin: .6em 1em;
  font-size: 1.2em;
}

@media (max-width:600px) {
  input[type="text"] {
    width: 70%;
  }
}
</style>