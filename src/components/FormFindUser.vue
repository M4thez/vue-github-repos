<template>
  <form @submit="findUser">
    <label for="name">Find GitHub user public repositories</label><br />
    <input type="text" v-model="username" name="username" placeholder="Find user" /><br />
    <input type="submit" value="Search" />
  </form>
  <!-- TODO - new component -->
  <div v-if="projectsList.length">
    <h2>Repositories list</h2>
    <ul v-for="project in projectsList" :key="project.id">
      <li>
        <p>{{ project.name }}</p>
      </li>
    </ul>
  </div>
  <div v-else-if="isSubmitted && projectsList.message === 'Not Found'">
    User "{{ submittedUsername }}" doesn't exist
  </div>
  <div v-else-if="isSubmitted && !projectsList.length">
    User "{{ submittedUsername }}" doesn't have any public repositories
  </div>
  <!--  -->
</template>

<script>
export default {
  name: "FormFindUser",
  data() {
    return {
      username: "",
      projectsList: [],
      isSubmitted: false,
      submittedUsername: "",
    };
  },
  methods: {
    findUser(e) {
      e.preventDefault()

      this.submittedUsername = this.username
      fetch(`https://api.github.com/users/${this.submittedUsername}/repos`)
        .then(response => response.json())
        .then(data => {
          this.projectsList = data
          this.isSubmitted = true
        })
        .catch(error => console.log(error.message))
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

ul {
  list-style-type: none;
}
</style>