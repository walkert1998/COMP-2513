<?php
date_default_timezone_set("America/Halifax");
echo "Author: Thomas Walker" . "<br>";
echo "Date: " . date("d-m-Y h:i:sa") . "<br>";
$x = 1;

while($x <= 5) {
  echo "The number is: $x <br>";
  $x++;
}
?>