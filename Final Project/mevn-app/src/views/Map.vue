<template>
  <div class="map">
    <div class="row">
        <div class="col-s-12 col-md-6">
            <modal
            v-show="isModalVisible"
            @close="closeModal">
                <template v-slot:body>
                    <p>{{ display_unit.name }}</p>
                    <p>Address: {{ display_unit.civic_address }}</p>
                    <p>Postal Code: {{ display_unit.postal_code }}</p>
                    <p># of Floors: {{ display_unit.num_floors }}</p>
                    <p>Community: {{ display_unit.community }}</p>
                    <p>{{ display_unit.pid }}</p>
                    <p>{{ display_unit.property }}</p>
                    <p>Residential Units: {{ display_unit.residential_units }}</p>
                    <p>Housing Authority: {{ display_unit.housing_authority }}</p>
                    <p>County: {{ display_unit.county }}</p>
                    <p>Elevator (or Chair Lift): {{ display_unit.elevator }}</p>
                    <p>Oil Heat: {{ display_unit.oil_heat }}</p>
                    <p>Electric Heat: {{ display_unit.electric_heat }}</p>
                    <p>Public Water: {{ display_unit.public_water }}</p>
                    <p>Well Water: {{ display_unit.well_water }}</p>
                    <p>Public Sewer: {{ display_unit.public_sewer }}</p>
                    <p>Onsite Septic: {{ display_unit.onsite_septic }}</p>
                    <p>Municipality: {{ display_unit.municipality }}</p>
                </template>
            </modal>
        </div>
    </div>
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
              <a @click="displayHousingUnit(unit)">{{unit.name}}</a>
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
import modal from './Modal.vue';
export default {
    name: 'Map',
    components: {
        modal,
    },
    data () {
        return {
            housingunits: [],
            model: {},
            display_unit: {},
            pleaseWait: false,
            isModalVisible: false
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
       showModal() {
            this.isModalVisible = true;
        },
        closeModal() {
            this.isModalVisible = false;
        },
        displayHousingUnit(unit) {
            this.display_unit = unit;
            this.showModal();
        }
    }
}
</script>