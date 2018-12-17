<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
$string = "`name` = '".$_POST['name']."', `adress` = '".$_POST['adress']."', `description` = '".$_POST['description']."'";
$table = "missions";
$id = $_POST['id'];
if($db->change($table, $string, $id) ) { echo "Daten gespeichert"; }


?>