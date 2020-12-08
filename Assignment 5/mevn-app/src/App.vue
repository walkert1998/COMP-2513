<template>
  <div>
    <div class="row">
      <button @click="toggleTheme">Toggle Theme</button>
    </div>
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/bookList">Book list</router-link> |
      <router-link to="/weather">Weather</router-link> |
      <router-link to="/about">About</router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  methods: {
    toggleTheme() {
      document.body.classList.toggle('dark');
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: var(--color-page-background);
  color: var(--color-text);
}

body {
  min-height: 100vh;
  margin: 0;
  height: 100%;
  background-color: var(--color-page-background);
}

#nav {
  padding: 30px;
  padding-bottom: 50px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.row {
  position: absolute;
  right: 10%;
  top: 1%;
}
</style>
