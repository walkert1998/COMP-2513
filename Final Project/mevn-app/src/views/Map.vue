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
                                <h4>Info</h4>
                                <p>Address: {{ display_unit.address }}</p>
                                <p>Postal Code: {{ display_unit.postal_code }}</p>
                                <p>City/Town: {{ display_unit.city }}</p>
                                <p>County: {{ display_unit.county }}</p>
                                <p>Municipality: {{ display_unit.municipality }}</p>
                                <p>Housing Authority: {{ display_unit.housing_authority }}</p>
                                <h4>Features</h4>
                                <p>Residential Units: {{ display_unit.residential_units }}</p>
                                <p>Number of Floors: {{ display_unit.number_of_floors }}</p>
                                <p>Elevator (or Chair Lift): {{ display_unit.elevator }}</p>
                                <p>Oil Heat: {{ display_unit.oil_heat }}</p>
                                <p>Electric Heat: {{ display_unit.electric_heat }}</p>
                                <p>Public Water: {{ display_unit.public_water }}</p>
                                <p>Well Water: {{ display_unit.well }}</p>
                                <p>Public Sewer: {{ display_unit.sewer }}</p>
                                <p>Onsite Septic: {{ display_unit.onsite_septic }}</p>
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
        </div>
    </div>
    <div class="row">
      <div class="col-s-12 col-md-8" id="map-area">
        
      </div>
      <div class="col-s-12 col-md-4">
        <div class="row">
          <div class="col-s-12 col-md-12">
            <h4>Search for public housing</h4>
          </div>
          <div class="col-s-12 col-md-12">
            <select id="address-search" v-model="selected">
                <option value="default" disabled>--Select City/Town--</option>
                <option>Any</option>
                <option v-for="option in options" :key="option">{{ option }}</option>
            </select>
            <button @click="searchResults()">Search</button>
            <hr  />
          </div>
        <vue-scroll-snap class="results">
          <div class="col-s-12 col-md-12">
            <div v-for="result in results" :key="result._id" @click="displayHousingUnit(result)" class="result">
              <h4>{{result.name}}</h4>
              <p>Number of residential units: {{result.residential_units}}</p>
              <p>Address: {{result.address}}</p>
              <hr  />
            </div>
          </div>
          </vue-scroll-snap>
        </div>
      </div>
    </div>
    
    <div class="row justify-content-center">
      
      
    </div>
  </div>
</template>

<style scoped>
#map-area {
    height: 800px;
}

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

.close {
    color: var(--color-text);
}

hr {
    background-color: var(--color-text);
}

.result:hover {
    background-color: #a5a5a5;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-body {
    display: flex;
    background-color: var(--color-page-background);
    flex-direction: column;
    overflow-x: auto;
}

.modal-header, .modal-footer {
    background-color: var(--color-page-background);
}

.item {
    /* Set the minimum height of the items to be the same as the height of the scroll-snap-container.*/
    min-height: 50vh;
  }

  .scroll-snap-container {
    height: 50vh;
    width: 100%;
  }

  .results {
    height: 75vh;
  }
</style>

<script>
import axios from 'axios'
import VueScrollSnap from "vue-scroll-snap";
import gmapsInit from '../utils/gmaps';

export default {
    name: 'Map',
    components: {VueScrollSnap},
    async mounted() {
        this.google = await gmapsInit();
        this.geocoder = new this.google.maps.Geocoder();
        this.map = new this.google.maps.Map(document.getElementById('map-area'),{
            streetViewControl: false
        });
        this.initMap(true)
    },
    data () {
        return {
            housingunits: [],
            model: {},
            options: [],
            results: [],
            display_unit: {},
            pleaseWait: false,
            showModal: false,
            locations: [],
            selected: "default",
            google: null,
            map: null,
            markers: []
        }
    },
    created () {
        this.getAPIData()
    },
    methods: {
        initMap(test) {
            try {
                this.geocoder.geocode({ address: 'Nova Scotia' }, (mapresults, status) => {
                    if (status !== 'OK' || !mapresults[0]) {
                        throw new Error(status);
                    }
                
                    this.map.setCenter(mapresults[0].geometry.location);
                    this.map.fitBounds(mapresults[0].geometry.viewport);
                });
                if (test) {
                    this.locations.forEach(point => {
                        var marker = new this.google.maps.Marker({position: point, map: this.map})
                        marker.addListener("click", () => {
                            this.displayHousingUnit(point.unit)
                        });
                        marker.setMap(this.map)
                        this.markers.push(marker)
                    });
                } else {
                    this.locations = []
                    for(var i=0; i<this.markers.length; i++){
                        console.log(this.markers[i].getVisible())
                        this.markers[i].setVisible(false);
                    }
                }
                
            } catch (error) {
                console.error(error);
            }
        },
        getAPIUrl() {
            return 'https://data.novascotia.ca/resource/2d4m-9e6x.json'
        },
        getAPIData () {
            axios.get(this.getAPIUrl())
            .then(response => {
                this.housingunits = response.data
                this.populateDropdown()
            })
            .catch(e => {
                console.error(e)
                this.errors.push(e)
            })
        },
        cancelUnit () {
            this.model = {}
        },
       saveUnit(unit) {
            this.model = unit;
            console.log(this.model)
            console.log('this.model._id: ' + this.model._id)
            if  (this.model._id === undefined) {
                axios.post(this.getUrl() + '/housingunit', this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelUnit()
                })
                .catch(e => {
                    console.log(e)
                })
            } else {
                axios.put(this.getUrl() + '/housingunit/' + this.model._id, this.model)
                .then(response => {
                    console.log(response)
                    this.getData()
                    this.cancelUnit()
                })
                .catch(e => {
                    console.log(e)
                })                
            }
       },
        displayHousingUnit(unit) {
            this.display_unit = unit
            console.log(unit.address)
            this.showModal = true
        },
        populateDropdown() {
            this.housingunits.forEach(element => {
                if (!this.options.includes(element.city))
                    this.options.push(element.city)
            });
            this.options.sort()
            console.log(this.options)
        },
        searchResults() {
            if (this.selected != "Any") {
                this.results = []
                this.housingunits.forEach(element => {
                    if (element.city == this.selected)
                        this.results.push(element)
                });
            } else {
                this.results = this.housingunits
            }
            if (this.markers.length > 0) {
                this.initMap(false)
            }
            this.results.forEach(point => {
                var geolocation = {lat:Number(point.y_coordina), lng:Number(point.x_coordina), unit:point}
                this.locations.push(geolocation)
            })
            this.initMap(true)
        }
    }
}
</script>