/*
 * Licensed Funeral Homes, Crematoriums Cemeteries and Funeral Sellers in NS
 * https://data.novascotia.ca/Permits-and-Licensing/Licensed-Funeral-Homes-Crematoriums-Cemeteries-and/if4h-78fy
 *
 */

var retrievedData;
var results;

$(document).ready(function() {
	$('#establishment-display').hide();
});

function getAllData() {
	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
    $.getJSON(url, function (data) {
		retrievedData = data;
		getCities(retrievedData);
		$("#getDataButton").attr('onclick', 'getData(retrievedData)');
	});
}

function getCities(data) {
	let dropdown = $('#city_selection');
	dropdown.empty();
	// dropdown.append('<option selected="true" disabled>Choose State/Province</option>');
	// dropdown.prop('selectedIndex', 0);
	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
	var cities = new Array;
	$.each(data, function (key, entry) {
		console.log(retrievedData[0]);
		if (jQuery.inArray(entry.city, cities) === -1) {
			cities.push(entry.city);
		}
		else {
			console.log("City " + entry.city + " already loaded");
		}
	})
	cities.sort();
	console.log(cities.length + " cities retrieved.");
	dropdown.append($('<option></option>').val("Any").html("Any"));
	$.each(cities, function (index, value) {
		dropdown.append($('<option></option>').val(cities[index]).html(cities[index]));
	});
}

function getData(data) {
	$('#establishment-display').show();
	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
	var city_selection = $('#city_selection').val();
	var license_selection = $('#license_selection').val();
	var resultPrefab;
	results = new Array;
	let result_section = $('#results');
	result_section.empty();
	for(var i = 0; i < data.length; i++) {
		if (city_selection !== "Any" && license_selection !== "Any") {
			if (data[i].city.indexOf(city_selection) === 0 && data[i].license_type.indexOf(license_selection) === 0) {
				console.log(data[i]);
				results.push(data[i]);
			}
		} else if (city_selection != "Any") {
			console.log(city_selection + ' ' + license_selection);
			if (data[i].city.indexOf(city_selection) === 0) {
				console.log(data[i]);
				results.push(data[i]);
			}
		} else if (license_selection != "Any") {
			if (data[i].license_type.indexOf(license_selection) === 0 || data[i].license_type.includes(license_selection)) {
				console.log(data[i]);
				results.push(data[i]);
			}
		} else {
			console.log(data[i]);
			results.push(data[i]);
		}
	}
	if (results.length < 1) {
		console.log("No results");
		result_section.append($('<h2></h2>').html('No Results Found...'));
	} else {
		result_section.append($('<h2></h2>').html(results.length + ' Results Found:'));
		result_section.append($('<div class="row result"></div>').html('<div class="col-sm-4"><p>Name</p></div><div class="col-sm-4"><p>Service(s)</p></div><div class="col-sm-4"><p>Location</p></div>'));
		$.each(results, function (index, value) {
			resultPrefab = '<a href="javascript:displayEstablishment(results['+index+']);" id="result-'+ (index + 1) + '"><div class="row result"><div class="col-sm-4"><p>'+ results[index].licensee_name + '</p></div><div class="col-sm-4"><p>'+ results[index].license_type + '</p></div><div class="col-sm-4"><p>'+ results[index].city + '</p></div></div><br  /></a>'
			result_section.append(resultPrefab);
			// $("#result-"+(index + 1)).attr('onclick', 'displayEstablishment(retrievedData['+index+'])');
		});
	}
}

function displayEstablishment (establishment) {
	$('#establishment-name').html(establishment.licensee_name);
	$('#establishment-address').html("Address: " + establishment.address);
	$('#establishment-sales').html("Pre-arranged Funeral Plan Sales: " + establishment.pre_arranged_funeral_plan_sales);
	$('#google-map').attr('src', "https://www.google.com/maps/embed/v1/place?key=AIzaSyCM1Aixhmhyha1Knp3yg5wQ9fhBbcDHhIE&q=" + establishment.address + "," + establishment.city);
	// $('#google-map').attr('src', "https://www.google.com/maps/embed/v1/place?key=AIzaSyCM1Aixhmhyha1Knp3yg5wQ9fhBbcDHhIE&q=" + establishment.location_geocode.latitude + ',' + establishment.location_geocode.longitude);
}

