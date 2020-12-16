var express = require('express');
var router = express.Router();
var mongoose = require('mongoose');
var HousingUnit = require('../models/HousingUnit.js');

//GET ALL HOUSINGUNITS
router.get('/', function(req, res, next) {
  HousingUnit.find(function (err, products) {
    if (err) return next(err);
    res.json(products);
  });
});

//GET SINGLE HOUSINGUNIT BY ID
router.get('/:id', function(req, res, next) {
  HousingUnit.findById(req.params.id, function (err, post) {
    if (err) return next(err);
    res.json(post);
  });
});

//SAVE HOUSINGUNIT
router.post('/', function(req, res, next) {
  HousingUnit.create(req.body, function (err, post) {
    if (err) return next(err);
    res.json(post);
  });
});

//UPDATE HOUSINGUNIT
router.put('/:id', function(req, res, next) {
  HousingUnit.findByIdAndUpdate(req.params.id, req.body, function (err, post) {
    if (err) return next(err);
    res.json(post);
  });
});

//DELETE HOUSINGUNIT
router.delete('/:id', function(req, res, next) {
  HousingUnit.findByIdAndRemove(req.params.id, req.body, function (err, post) {
    if (err) return next(err);
    res.json(post);
  });
});

module.exports = router;