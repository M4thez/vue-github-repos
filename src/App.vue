<template>
  <h1>Repositories of the GitHub users</h1>
  <img alt="GitHub logo" src="./assets/GitHub_Logo.png" id="github-img" />
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
  text-align: center;
  color: #2c3e50;
  margin-top: 3em;
  font-size: 18px;
}

body {
  background-color: #f4f4f4;
}

#github-img {
  max-width: 30%;
}

.button {
  background-color: #555555;
  color: white;
  border: 2px solid #555555;
  border-radius: .2em;
  padding: .8em 1.4em;
  margin: .8em 0 .4em;
  transition-duration: .4s;
}

.button:hover {
  background-color: white;
  color: #555555;
}

.button:active {
  background-color: #dddddd;
}

@media (max-width:1000px) {
  #github-img {
    max-width: 50%;
  }
}

@media (max-width:600px) {
  #github-img {
    max-width: 70%;
  }
}
</style>
