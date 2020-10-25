<?php
date_default_timezone_set("America/Halifax");
echo "Author: Thomas Walker" . "<br>";
echo "Date: " . date("d-m-Y h:i:sa") . "<br>";
$x = 6;

do {
  echo "The number is: $x <br>";
  $x++;
} while ($x <= 5);
?>