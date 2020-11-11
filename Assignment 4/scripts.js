
$(document).ready(function() {
	$("#getContactsButton").click(getContacts);
});

$(document).ready(function() {
	$("#searchButton").click(getContact);
});

$(document).ready(function() {
	$("#deleteContactButton").click(deleteContact);
});

$(document).ready(function() {
	$("#addNewContactButton").click(function() {
		clearContactInfo();
		$("#submitEdit").off('click');
		$("#submitEdit").click(createContact);
	});
});

function clearContactInfo()
{
	$("#edit_id").val("");
	$("#edit_fname").val("");
	$("#edit_lname").val("");
	$("#edit_email").val("");
	$("#edit_birthdate").val("");
	$(".contact-info").css("display", "inline");
}

function selectContact(id, first_name, last_name, email, birthdate) {
	$(".contact-info").css("display", "inline");
	$("#edit_id").val(id);
	$("#edit_fname").val(first_name);
	$("#edit_lname").val(last_name);
	$("#edit_email").val(email);
	$("#edit_birthdate").val(birthdate);
	$("#submitEdit").click(function(){
		var url = 'http://localhost/assignment4/service.php?action=updatecontact&author_id=' + $("#edit_id").val() + '&first_name=' + $("#edit_fname").val() + "&last_name=" + $("#edit_lname").val() + "&email=" + $("#edit_email").val() + "&birthdate=" + $("#edit_birthdate").val();
		console.log(url);
		$.ajax({
			url: url,
			method: 'post',
			dataType: "json",
			success: function(data){
				alert("Contact info updated.");
				getContacts();
			},
			error: function() {
				alert("Contact could not be updated, an error occurred while processing JSON.");
			}
		});
	});
}



function getContacts() {
	console.log("run stuff!");
	var url = 'http://localhost/assignment4/service.php?action=getcontacts';
    $.ajax({
		url: url,
		method: 'get',
		dataType: "json",
		success: function(data){
			console.log(data.getcontacts);
            var displayData = "";
            for(var i = 0; i < data.getcontacts.length; i++) {
                var contact = data.getcontacts[i];
                console.log("FirstName: " + contact.first_name + ", LastName: " + contact.last_name);
                displayData += "<tr class=\"clickable-row\">" + "<td id=\"contact_id\">" + contact.id + "</td>" + "<td id=\"first_name\">" + contact.first_name + "</td><td id=\"last_name\">" + contact.last_name + "</td><td id=\"email\">" + contact.email + "</td><td id=\"birthdate\">" + contact.birthdate + "</td>";
            }
			$("#contactContent").html(displayData);
			$('tr').on('click', function() {
				$(this).addClass('highlight').siblings().removeClass('highlight');
				$("#edit_fname").val($(this).find("#first_name").text());
				selectContact(
					$(this).find("#contact_id").text(),
					$(this).find("#first_name").text(),
					$(this).find("#last_name").text(),
					$(this).find("#email").text(),
					$(this).find("#birthdate").text(),
					);
			});
		},
		error: function() {
			alert("Data could not be retrieved, an error occurred while processing JSON.");
		}
	});
}

function getContact() {
	var url = 'http://localhost/assignment4/service.php?action=getcontact&author_id=' + $("#search_id").val();
	console.log(url);
	$.ajax({
		url: url,
		method: 'get',
		dataType: "json",
		success: function(data){
			console.log(data.getcontact);
			var displayData = "";
			var contact = data.getcontact[0];
			console.log("FirstName: " + contact.first_name + ", LastName: " + contact.last_name);
			displayData += "<tr class=\"clickable-row\">" + "<td id=\"contact_id\">" + contact.id + "</td>" + "<td id=\"first_name\">" + contact.first_name + "</td><td id=\"last_name\">" + contact.last_name + "</td><td id=\"email\">" + contact.email + "</td><td id=\"birthdate\">" + contact.birthdate + "</td>";
			$("#contactContent").html(displayData);
			$('tr').on('click', function() {
				$(this).addClass('highlight').siblings().removeClass('highlight');
				$("#edit_fname").val($(this).find("#first_name").text());
				selectContact(
					$(this).find("#contact_id").text(),
					$(this).find("#first_name").text(),
					$(this).find("#last_name").text(),
					$(this).find("#email").text(),
					$(this).find("#birthdate").text(),
					);
			});
		},
		error: function() {
			alert("Data could not be retrieved, an error occurred while processing JSON.");
		}
	});
}

function deleteContact() {
	var url = 'http://localhost/assignment4/service.php?action=deletecontact&author_id=' + $("#edit_id").val();
	console.log(url);
	$.ajax({
		url: url,
		method: 'post',
		dataType: "json",
		success: function(){
			alert("Contact deleted.");
			clearContactInfo();
		},
		error: function() {
			alert("Contact could not be deleted, an error occurred while processing JSON.");
		}
	});
}

function createContact() {
	var url = 'http://localhost/assignment4/service.php?action=createcontact&first_name=' + $("#edit_fname").val() + "&last_name=" + $("#edit_lname").val() + "&email=" + $("#edit_email").val() + "&birthdate=" + $("#edit_birthdate").val();
	console.log(url);
	$.ajax({
		url: url,
		method: 'post',
		dataType: "json",
		success: function(){
			alert("Contact created.");
			clearContactInfo();
		},
		error: function() {
			alert("Contact could not be deleted, an error occurred while processing JSON.");
		}
	});
}