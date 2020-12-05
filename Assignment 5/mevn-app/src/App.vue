<template>
  <div>
    <button @click="toggleTheme">Toggle Theme</button>
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
  data() {
    return {
      theme: 'light' // default theme to use when the site is first loaded
    }
  },
  watch: {
    theme(theme) {
      document.documentElement.dataset.theme = theme // this is where the magic happens
    } // the `dataset.theme` is the data-theme attribute I set in my SCSS file (highlighted above)
  },
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
</style>
