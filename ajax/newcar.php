<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
$table = "cars";
$columns = "`name`, `funk`, `besatzung_soll`, `organisation`";
$vals = "'".$_POST['name']."', '".$_POST['funk']."', '".$_POST['besatzung']."', '".$_POST['organisation']."'";
if($db->insert($table, $columns,$vals) ) { echo "Daten gespeichert"; }
?>