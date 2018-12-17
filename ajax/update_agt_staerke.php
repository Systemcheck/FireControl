<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);

$string =  "`staerke` = '".$_POST['staerke']."', `agt` = '".$_POST['agt']."'";
$table = "missioncars";
$id = $_POST['missioncarid'];
if($db->change($table, $string, $id) ) { echo 'Datensatz "ID: '.$id.'" gespeichert'; }

?>