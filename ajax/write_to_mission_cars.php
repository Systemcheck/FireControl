<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) { echo 'error'; }

//Klassen und Konfiguration laden
require_once('../configuration.php');
require_once('../classes/Db.class.php');

//Datenbankabfragen
$db = new Db($options,$attributes);

//table missioncars
$date = date( "Y-m-d ".$_POST['ankunft'].":s");
$columns = "`mission_id`, `staerke`, `standort`, `agt`, `name`, `arrived`, `organisation`,`carid`,`funk`";
$vals = "'".$_POST['missionid']."', '".$_POST['staerke']."', '".$_POST['standort']."', '".$_POST['agt']."', '".$_POST['name']."', '".$date."', '".$_POST['organisation']."', '".$_POST['carid']."', '".$_POST['funk']."'";
$db->insert('missioncars',$columns, $vals);

//table messages
$message = $_POST['funk'] . ' erreicht ' . $_POST['standort'];
$columns = "`mission_id`, `message`, `from`";
$vals = "'".$_POST['missionid']."', '".$message."', 'System'";
$db->insert('messages',$columns, $vals);

echo 'Datensatz <strong>' . $_POST['funk'] . ' </strong> gespeichert';




?>