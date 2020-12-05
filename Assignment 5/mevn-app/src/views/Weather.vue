<template>
  <div class="weather">
    <h3>Weather</h3>
    <div>
        <p v-if="loading" class="text-danger">
            PLEASE WAIT... LOADING
        </p>
        <p v-if="!loading">
            The weather in {{ (weatherData.name != null? weatherData.name : '') }} 
            is: {{ (weatherData.weather != null ? weatherData.weather[0].description : 'none') }} 
        </p>
    </div>
  </div>
</template>

<style>
.weather {
    width: 400px;
    margin: auto;
}
</style>

<script>
import axios from 'axios'

export default {
  name: 'Weather',
  data () {
    return {
        loading: false,
        weatherData: []
    }
  },
  methods:{
    async getWeather () {
      this.loading = true;
      try {
        let url = 'http://api.openweathermap.org/data/2.5/weather?id=6183858&appid=2ad263b9a82888fd39382d86aa2fc030&mode=json';
        axios.get(url)
          .then(response => {
            this.weatherData = response.data
          })
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => {
            this.loading = false
            console.log(this.weatherData)
            }
        )
      } catch (err) {
        console.log(err);
      }
    }
  },
  beforeMount(){
    this.getWeather()
  }  
}
</script>