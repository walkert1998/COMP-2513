<?php
//https://www.w3schools.com/php/php_mysql_select.asp
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

$author_id = isset($_GET['author_id']) ? $_GET['author_id'] : '';
$first_name = isset($_GET['first_name']) ? $_GET['first_name'] : '';
$last_name = isset($_GET['last_name']) ? $_GET['last_name'] : '';
$email = isset($_GET['email']) ? $_GET['email'] : '';
$birthdate = isset($_GET['birthdate']) ? $_GET['birthdate'] : '';

$db_servername = "localhost:3306";
$db_username = "contactsdb";
$db_password = "contactsdb";
$db_name = "contacts";

$db_conn = new mysqli($db_servername, $db_username, $db_password, $db_name);
if ($db_conn->connect_error) {
    die("Connection failed: " . $db_conn->connect_error);
} 

$sql = "";
if ($action === "getcontacts") {
	$sql = "SELECT id, first_name, last_name, email, birthdate FROM contacts;";
} elseif ($action === "getcontact") {
	$sql = "SELECT id, first_name, last_name, email, birthdate FROM contacts WHERE id = " . $author_id . ";";
} elseif ($action === "createcontact") {
	$sql = "INSERT INTO contacts(first_name,last_name,email,birthdate) VALUES('" . $first_name ."','" . $last_name ."','" . $email . "','" . $birthdate ."')";
} elseif ($action === "updatecontact") {
	$sql = "UPDATE contacts SET first_name = '" . $first_name . "', last_name = '" . $last_name . "', email = '" . $email . "', birthdate = '" . $birthdate . "' WHERE id = " . $author_id . ";";
} elseif ($action === "deletecontact") {
	$sql = "DELETE FROM contacts WHERE id = '" . $author_id . "';";
} 

$db_result = $db_conn->query($sql);

if ($action === "getcontacts") {
	$arr = array();
	while($row = $db_result->fetch_assoc()){	$arr[] = $row; }
	
	echo "{ \"" . $action . "\": " . json_encode($arr) . "}";

	$db_result->free();

} elseif ($action === "getcontact") {
	$arr = array();
	while($row = $db_result->fetch_assoc()){	$arr[] = $row; }
	
	echo "{ \"" . $action . "\": " . json_encode($arr) . "}";

	$db_result->free();

} elseif ($action === "createcontact") {
	$last_id = $db_conn->insert_id;
	
	if ($db_result === true) {
		echo "{ \"" . $action . "\": \"" . $last_id . "\"}";
	} else {
		echo "{ \"" . $action . "\": \"fail\",\"message\":\"" . mysqli_error($db_conn) . "\"}";
	}
} else {
	if ($db_result === true) {
		echo "{ \"" . $action . "\": \"success\"}";
	} else {
		echo "{ \"" . $action . "\": \"fail\",\"message\":\"" . mysqli_error($db_conn) . "\"}";
	}
}


$db_conn->close();
?>