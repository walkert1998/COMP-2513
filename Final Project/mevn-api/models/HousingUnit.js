var mongoose = require('mongoose');

var HousingUnitSchema = new mongoose.Schema({
  object_id: Number,
  property: String,
  PID: Number,
  name: String,
  civic_address: String,
  postal_code: String,
  num_floors: Number,
  residential_units: Number,
  housing_authority: String,
  county: String,
  elevator: String,
  oil_heat: String,
  electric_heat: String,
  public_water: String,
  well_water: String,
  public_sewer: String,
  onsite_septic: String,
  municipality: String,
  x_coordinate: Number,
  y_coordinate: Number,
});

module.exports = mongoose.model('HousingUnit', HousingUnitSchema);