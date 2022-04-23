<template>
  <img alt="Vue logo" src="./assets/logo.png" />
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
</style>
