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
          </div>
          <div class="col-s-12 col-md-12">
            <p>none</p>
            <div v-for="unit in housingunits" :key="unit._id">
              <h3>{{unit.name}}</h3>
              <p>{{unit.residential_units}}</p>
              <p>{{unit.civic_address}}</p>
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
