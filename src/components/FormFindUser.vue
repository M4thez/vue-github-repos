<template>
  <form @submit="findUser">
    <label for="name">Find GitHub user public repositories</label><br />
    <input type="text" v-model="username" name="username" placeholder="Find user" /><br />
    <input type="submit" value="Search" />
  </form>
  <ListRepos :repos="reposList" :is-submitted="isSubmitted" :submitted-username="submittedUsername" />
</template>

<script>
import ListRepos from "./ListRepos.vue";
export default {
  name: "FormFindUser",
  components: {
    ListRepos,
  },
  data() {
    return {
      username: "",
      reposList: [],
      isSubmitted: false,
      submittedUsername: "",
    };
  },
  methods: {
    findUser(e) {
      e.preventDefault();
      this.submittedUsername = this.username;
      fetch(`https://api.github.com/users/${this.submittedUsername}/repos`)
        .then(response => response.json())
        .then(data => {
          this.reposList = data;
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
  margin: .3em;
}

input[type="submit"] {
  padding: .6em;
  margin: .3em;

}
</style>