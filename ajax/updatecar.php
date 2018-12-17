<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
print_r($_POST);
$string =  "`organisation` = '".$_POST['organisation']."', 
            `name` = '".$_POST['name']."', `funk` = '".$_POST['funk']."', `besatzung_soll` = '".$_POST['besatzung']."'";
$table = "cars";
$id = $_POST['id'];
if($db->change($table, $string, $id) ) { echo "Daten gespeichert"; }


?>