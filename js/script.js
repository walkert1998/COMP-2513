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
		dataUnique = jQuery.uniqueSort(data);
		$.each(dataUnique, function (key, entry) {
		
		  dropdown.append($('<option></option>').val(entry.city).html(entry.city));
		  console.log(entry.city);
		})
	});
}

function getData() {

	console.log("fetching data...");
	var url = 'https://data.novascotia.ca/resource/if4h-78fy.json';

	$.ajax({
		url: url,
		method: 'get'
	}).done(function(data) {
		
		for(var i = 0; i < data.length; i++) {
			if (data[i].city.indexOf('DARTMOUTH') === 0) {
				console.log("License Type: " + data[i].license_type);
			}
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