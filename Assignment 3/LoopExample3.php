<?php
date_default_timezone_set("America/Halifax");
echo "Author: Thomas Walker" . "<br>";
echo "Date: " . date("d-m-Y h:i:sa") . "<br>";
$age = array("Peter"=>"35", "Ben"=>"37", "Joe"=>"43");

foreach($age as $x => $val) {
  echo "$x = $val<br>";
}
?>