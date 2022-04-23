<template>
  <h1>Repositories of the GitHub users</h1>
  <img alt="GitHub logo" src="./assets/GitHub_Logo.png" />
  <FormFindUser />
</template>

<script>
import FormFindUser from "./components/FormFindUser.vue";

export default {
  name: "App",
  components: {
    FormFindUser,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

body {
  background-color: #f4f4f4;
}

img {
  max-width: 30%;
}
</style>
