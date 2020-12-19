<template>
  <div>
    <h1>Affordable Housing NS</h1>
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/map">Map</router-link>
      <!-- <router-link @click="toggleTheme">Toggle Theme</router-link> -->
    </div>
    <div class="container-fluid">
      <router-view/>
      <div class="row footer">
          <div class="col-s-12">
            <button @click="toggleTheme" id="theme-toggle">Toggle Theme</button>
          </div>
          <hr  />
          <div class="col-s-12">
            <p>&copy; Thomas Walker 2020</p>
          </div>
      </div>
    </div>
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
  color: var(--color-text);
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.footer {
  position: fixed;
  bottom: 0;
  background-color: #000;
  color: #ffffff;
  height: 30px;
  justify-content: center;
  width: 100%;
}

#theme-toggle {
  left: 0;
}
#theme-toggle:hover {
  text-decoration: underline;
}
</style>
