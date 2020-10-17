$(document).ready(function() {
	$("#getStudentsButton").click(getStudents);
});


function getStudents() {
	console.log("run stuff!");
	var url = 'http://comp2513.azurewebsites.net/api/students';

	$.ajax({
		url: url,
		method: 'get'
	}).done(function(data) {
		//console.log(data);
		for(var i = 0; i < data.length; i++) {
			console.log("FirstName: " + data[i].FirstName + ", LastName: " + data[i].LastName);

		}
	});
}