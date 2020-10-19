/*
 * Licensed Funeral Homes, Crematoriums Cemeteries and Funeral Sellers in NS
 * https://data.novascotia.ca/Permits-and-Licensing/Licensed-Funeral-Homes-Crematoriums-Cemeteries-and/if4h-78fy
 *
 */

var retrievedData;

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
	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
	var city_selection = $('#city_selection').val();
	var license_selection = $('#license_selection').val();
	var results = new Array;
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
			if (data[i].license_type.indexOf(license_selection) === 0) {
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
		result_section.append($('<div class="row result"></div>').html('<div class="col-sm-4"><p>Name</p></div><div class="col-sm-4"><p>Services</p></div><div class="col-sm-4"><p>Location</p></div>'));
		$.each(results, function (index, value) {
			result_section.append($('<a href="#"></a>').html('<div class="row result"><div class="col-sm-4"><p>'+ results[index].licensee_name + '</p></div><div class="col-sm-4"><p>'+ results[index].license_type + '</p></div><div class="col-sm-4"><p>'+ results[index].city + '</p></div></div><br  />'));
		})
	}
}

function displayEstablishment () {
	$('#establishment-name')
}