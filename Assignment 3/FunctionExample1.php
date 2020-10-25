<?php
date_default_timezone_set("America/Halifax");
echo "Author: Thomas Walker" . "<br>";
echo "Date: " . date("d-m-Y h:i:sa") . "<br>";
function writeMsg() {
  echo "Hello world!";
}

writeMsg(); // call the function
?>