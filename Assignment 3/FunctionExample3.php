<?php
date_default_timezone_set("America/Halifax");
echo "Author: Thomas Walker" . "<br>";
echo "Date: " . date("d-m-Y h:i:sa") . "<br>";
function add_five(&$value) {
  $value += 5;
}

$num = 2;
add_five($num);
echo $num;
?>