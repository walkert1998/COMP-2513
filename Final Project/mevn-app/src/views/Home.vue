<template>
  <div class="home">
    <h3>Welcome</h3>
    <p>This site is intended to help you locate public housing facilities for seniors in Nova Scotia.</p>
    <p>Data taken from <a target="_blank" href="https://data.novascotia.ca/Community-Services/Public-Housing-Units-Nova-Scotia-Seniors/2d4m-9e6x">data.novascotia.ca</a></p>
    <p>To begin searching, <router-link to="/map">visit the Map now!</router-link>.</p>
    <h3>Features</h3>
    <p>You can toggle between "light" and "dark" modes by selecting the "Toggle Theme" button in the bottom left corner of the screen.</p>
  </div>
</template>

<script>
export default {
  name: 'Home',
  components: {
  }
}
</script>
