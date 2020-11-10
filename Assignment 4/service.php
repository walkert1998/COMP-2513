<?php
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';
$student_id = isset($_GET['author_id']) ? $_GET['author_id'] : '';

$db_servername = "localhost:8080";
$db_name = "contacts";
$db_username = "root";
$db_password = "root";

$db_conn = new mysqli($db_servername, $db_username, $db_password, $db_name);
if ($db_conn->connect_error) {
    die("Connection failed: " . $db_conn->connect_error);
} 

$sql = "";
if ($action === "getcontacts") {
	$sql = "SELECT id, first_name, last_name, email, birthdate FROM contacts;";
} elseif ($action === "getcontact") {
	$sql = "SELECT id, first_name, last_name, email, birthdate FROM contacts where id = '" . $student_id . "';";
} 

$db_result = $db_conn->query($sql);

if ($action === "getcontacts" || $action === "getcontact" && $student_id != "") {
	$arr = array();
	while($row = $db_result->fetch_assoc()){	$arr[] = $row; }
	
	echo "{ \"" . $action . "\": " . json_encode($arr) . "}";

	$db_result->free();
}

$db_conn->close();
?>