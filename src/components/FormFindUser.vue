<template>
  <form @submit="findUser">
    <div>
      <label>Find</label>
      <input type="text" v-model="username" name="username" placeholder="Find User" />
    </div>
    <input type="submit" value="Search" />
  </form>

</template>

<script>
export default {
  name: "FormFindUser",
  data() {
    return {
      username: "",
    };
  },
  methods: {
    findUser(e) {
      e.preventDefault();
      fetch(`https://api.github.com/users/${this.username}/repos`)
        .then(response => response.json())
        .then(data => console.log(data));

    }
  },
};
</script>

<style scoped>
p {
  color: aliceblue;
}
</style>