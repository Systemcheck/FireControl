<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) { echo 'error'; }

//Klassen und Konfiguration laden
require_once('../configuration.php');
require_once('../classes/Db.class.php');
require_once('../classes/Template.class.php');
$db = new Db($options,$attributes);
$mission_id = $db->getLastMissionId(); 

$messagefields      = '`message`, `id`, `from`, `dispo`, `created_at`, DATE_FORMAT(created_at,"%d.%m. %H:%i") as nicedate';
$orderby            = " WHERE `mission_id` = '".$mission_id."' ORDER BY `id` DESC";
$messages           = $db->selectMultiple('messages',$orderby,$messagefields);
$trow = '';
$anzahl = count($messages);
$i = $anzahl;

foreach($messages as $message) {

$date = $message['nicedate'];

$trow .='<tr><th scope="row">'.$i.'</th><td>'.$date.'</td><td>'.$message['message'].'</td><td>'.$message['from'].'</td><td>'.$message['dispo'].'</td></tr>'; $i = $i-1; }
echo $trow;
?>