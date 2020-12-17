<template>
  <div class="map">
      <div class="row justify-content-center">
        <div class="col-s-12">
          <h3>Search for public housing</h3>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-s-4">
          <p>none</p>
            <div v-for="unit in housingunits" :key="unit._id">
              <h3>{{unit.name}}</h3>
              <p>{{unit.residential_units}}</p>
              <p>{{unit.civic_address}}</p>
            </div>
        </div>
        <div class="col-s-8">
            <input type="text" id="address-search"/>
        </div>
      </div>
    </div>
</template>
