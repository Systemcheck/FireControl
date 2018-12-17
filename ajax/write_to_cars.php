<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) { echo 'error'; }

//Klassen und Konfiguration laden
require_once('../configuration.php');
require_once('../classes/Db.class.php');

//Datenbankabfragen
$db = new Db($options,$attributes);
$columns = "`mission_id`, `message`, `from`, `dispo`";
$vals = "'".$_POST['missionid']."', '".$_POST['message']."', '".$_POST['from']."', '".$_POST['user']."'";
$db->insert('messages',$columns, $vals);
echo $_POST['message'].' von '.$_POST['from'].' gespeichert';


?>