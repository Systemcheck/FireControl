<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) {header("Location: index.php?message=Session nicht gesetzt", true, 301);}

//Klassen und Konfiguration laden
require_once('configuration.php');
require_once('classes/Db.class.php');
require_once('classes/Template.class.php');

//Datenbankabfragen
$tpl = new Template();
$db  = new Db($options,$attributes);
$id  = $_GET['item'];
//Einsatzdaten

$w = " Where id = ".$id;
$m = $db->selectOne('missions',$w,'*, DATE_FORMAT(created_at,"%d.%m.%Y %H:%i:%s") as protokolldate ');    //DATE_FORMAT(created_at,"%d.%m.%Y %H:%i") vollständig

//Protokolldaten
$orderby = " Where mission_id = ".$id;
$me      = $db->selectMultiple('messages',$orderby,'*, DATE_FORMAT(created_at,"%H:%i") as date ');


foreach($me as $message) { $messages .= '<tr><td><i>'.$message['date'].'&nbsp;</i></td><td>'.$message['message'].'</td><td>'.$message['from'].'</td></tr>'; }
$messagecontainer = '<table width="80%"><tr><th>Uhrzeit</th><th>Eintrag</th><th>Melder</th></tr>'.$messages.'</table>';
//template erstellen
$tpl->load('print.tpl');
$tpl->assign('protokolldatum', $m['protokolldate']);
$tpl->assign('pagetitle',  'FW Zweibrücken - Einsatzbericht');
$tpl->assign('einsatzart',$m['name']);
$tpl->assign('bemerkung', $m['description']);
$tpl->assign('adresse', $m['adress']);
$tpl->assign('hausnummer', $m['number']);
$tpl->assign('messages', $messagecontainer);
$tpl->display();

?>