<template>
  <form @submit="findUser">
    <label for="name">Find</label>
    <input type="text" v-model="username" name="username" placeholder="Find user" />
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
  <div v-else-if="isSubmitted && !projectsList.length">User {{ submittedUsername }}
    doesn't exist</div>
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
</style>