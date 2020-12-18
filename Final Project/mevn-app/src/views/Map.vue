<template>
  <div class="map">
    <div class="row">
        <div class="col-s-12 col-md-6">
            <div v-if="showModal">
                <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">{{ display_unit.name }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" @click="showModal = false">&times;</span>
                            </button>
                        </div>
                        <vue-scroll-snap>
                            <div class="modal-body">
                                <!-- <p>{{ display_unit._id }}</p> -->
                                <h4>Info</h4>
                                <p>Address: {{ display_unit.civic_address }}</p>
                                <p>Postal Code: {{ display_unit.postal_code }}</p>
                                <p># of Floors: {{ display_unit.num_floors }}</p>
                                <p>Community: {{ display_unit.community }}</p>
                                <!-- <p>{{ display_unit.pid }}</p> -->
                                <!-- <p>{{ display_unit.property }}</p> -->
                                <p>Residential Units: {{ display_unit.residential_units }}</p>
                                <p>Housing Authority: {{ display_unit.housing_authority }}</p>
                                <p>County: {{ display_unit.county }}</p>
                                <h4>Features</h4>
                                <p>Elevator (or Chair Lift): {{ display_unit.elevator }}</p>
                                <p>Oil Heat: {{ display_unit.oil_heat }}</p>
                                <p>Electric Heat: {{ display_unit.electric_heat }}</p>
                                <p>Public Water: {{ display_unit.public_water }}</p>
                                <p>Well Water: {{ display_unit.well_water }}</p>
                                <p>Public Sewer: {{ display_unit.public_sewer }}</p>
                                <p>Onsite Septic: {{ display_unit.onsite_septic }}</p>
                                <p>Municipality: {{ display_unit.municipality }}</p>
                            </div>
                        </vue-scroll-snap>
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="showModal = false">Close</button>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                </transition>
            </div>
            <!-- <modal
            v-show="isModalVisible"
            @close="closeModal">
                <template v-slot:body>
                    <p>{{ display_unit.name }}</p>
                    <p>{{ display_unit._id }}</p>
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
            </modal> -->
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

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-body {
    display: flex;
    flex-direction: column;
    overflow-x: auto;
}

.item {
    /* Set the minimum height of the items to be the same as the height of the scroll-snap-container.*/
    min-height: 50vh;
  }

  .scroll-snap-container {
    height: 50vh;
    width: 100%;
  }
</style>

<script>
import axios from 'axios'
import VueScrollSnap from "vue-scroll-snap";
export default {
    name: 'Map',
    components: {VueScrollSnap},
    data () {
        return {
            housingunits: [],
            model: {},
            display_unit: {},
            pleaseWait: false,
            showModal: false
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
        displayHousingUnit(unit) {
            this.display_unit = unit;
            this.showModal = true;
        }
    }
}
</script>