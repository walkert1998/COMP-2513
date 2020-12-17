<template>
  <div class="map">
    <div class="row">
      <div class="col-s-12 col-md-4">
        <div class="row">
          <div class="col-s-12 col-md-12">
            <h4>Search for public housing</h4>
          </div>
          <div class="col-s-12 col-md-12">
            <input type="text" id="address-search"/>
            <button>Search</button>
            <hr  />
          </div>
          <div class="col-s-12 col-md-12">
            <div v-for="unit in housingunits" :key="unit._id">
              <h3>{{unit.name}}</h3>
              <p>Number of residential units: {{unit.residential_units}}</p>
              <p>Address: {{unit.civic_address}}</p>
              <hr  />
            </div>
          </div>
        </div>
      </div>
      <div class="col-s-12 col-md-8">

      </div>
    </div>
    
    <div class="row justify-content-center">
      
      
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'Map',
    data () {
        return {
            housingunits: [],
            model: {},
            pleaseWait: false
        }
    },
    created () {
        this.getData()
    },
    methods: {
        getUrl() {
            return 'http://localhost:3000'
        },
        getData () {
            axios.get(this.getUrl() + '/housingunit')
            .then(response => {
                this.housingunits = response.data
            })
            .catch(e => {
                this.errors.push(e)
            })
        },
        populateBookToEdit (book) {
            this.model = book;
        },
        cancelBook () {
            this.model = {}
        },
        deleteBook (id) {
            if (confirm('Are you sure you want to delete this post?')) {
                axios.delete(this.getUrl() + '/housingunit/' + id)
                .then((result) => {
                    console.log(result)
                    this.getData()
                })
                .catch(e => {
                    console.log(e)
                })
            }
        },
        saveBook() {
            console.log(this.model)
            console.log('this.model._id: ' + this.model._id)
            if  (this.model._id === undefined) {
                axios.post(this.getUrl() + '/book', this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelBook()
                })
                .catch(e => {
                    console.log(e)
                })
            } else {
                axios.put(this.getUrl() + '/book/' + this.model._id, this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelBook()
                })
                .catch(e => {
                    console.log(e)
                })                
            }
       },
    }
}
</script>