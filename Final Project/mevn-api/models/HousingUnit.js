var mongoose = require('mongoose');

var HousingUnitSchema = new mongoose.Schema({
  object_id: Number,
  property_project: String,
  pid: Number,
  name: String,
  address: String,
  postal_code: String,
  number_of_floors: Number,
  residential_units: Number,
  housing_authority: String,
  county: String,
  city: String,
  elevator: String,
  oil_heat: String,
  electric_heat: String,
  public_water: String,
  well: String,
  sewer: String,
  onsite_septic: String,
  municipality: String,
  x_coordina: Number,
  y_coordina: Number,
});

module.exports = mongoose.model('HousingUnit', HousingUnitSchema);