/*
 * Licensed Funeral Homes, Crematoriums Cemeteries and Funeral Sellers in NS
 * https://data.novascotia.ca/Permits-and-Licensing/Licensed-Funeral-Homes-Crematoriums-Cemeteries-and/if4h-78fy
 *
 */

$(document).ready(function() {
	$("#getDataButton").click(getData);
});

function getCities() {
	let dropdown = $('#city_selection');
	dropdown.empty();
	// dropdown.append('<option selected="true" disabled>Choose State/Province</option>');
	// dropdown.prop('selectedIndex', 0);
	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
    $.getJSON(url, function (data) {
		var cities = new Array;
		$.each(data, function (key, entry) {
		  if (jQuery.inArray(entry.city, cities) === -1) {
			cities.push(entry.city);
		  }
		  else {
			console.log("City " + entry.city + " already loaded");
		  }
		})
		cities.sort();
		console.log(cities.length + " cities retrieved.");
		$.each(cities, function (index, value) {
			dropdown.append($('<option></option>').val(cities[index]).html(cities[index]));
		})
	});
}

function getData() {

	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';
	var city_selection = $('#city_selection').val();
	var license_selection = $('#license_selection').val();
	var results = new Array;
	$.ajax({
		url: url,
		method: 'get'
	}).done(function(data) {
		console.log(city_selection);
		console.log(license_selection);
		for(var i = 0; i < data.length; i++) {
			if (data[i].city.indexOf(city_selection) === 0 && data[i].license_type.indexOf(license_selection) === 0) {
				console.log(data[i]);
				results.push(data[i]);
			}
		}
		if (results.length < 1) {
			console.log("No results");
		}
		
		/*
		$.each(data, function(index, element) {
			if (element.geography.indexOf('Barrington') === 0 &&
				element.violations.indexOf('motor vehicle') !== -1) {
				console.log("Entry:___________________________");
				$.each(element, function(propName, propVal) {
	  				console.log(propName, propVal);
				});
			}
		});
		*/
	});

}