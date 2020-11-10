
$(document).ready(function() {
	$("#getContactsButton").click(getStudents);
});


function getStudents() {
	console.log("run stuff!");
	var url = 'http://localhost/assignment4/service.php?action=getcontacts';

	$.ajax({
		url: url,
		method: 'get'
	}).done(function(data) {
		//console.log(data.getstudents);
		var displayData = "";
		for(var i = 0; i < data.getcontacts.length; i++) {
			var contact = data.getcontacts[i];
			//console.log("FirstName: " + student.first_name + ", LastName: " + student.last_name);
			displayData += contact.first_name + " " + contact.last_name + "<br/>";
		}
		$("#contactListContainer").html(displayData);
	});
}

