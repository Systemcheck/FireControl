<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) {header("Location: index.php", true, 301);}

//Klassen und Konfiguration laden
require_once('configuration.php');
require_once('classes/Db.class.php');
require_once('classes/Template.class.php');
$db = new Db($options,$attributes);
$tpl =  new Template();

//Update to wert = 1 in Config
$mission_status   = $db->getConfig('mission');
if(isset($_GET['startmission']) && $mission_status == 0) {
$db->startMission();
$table = 'missions';
$columns = "`name`";
$vals = "'Neuer Einsatz'";
$db->insert($table,$columns,$vals);
}

$orderby = ' ORDER BY `street` ASC';
$streets = $db->selectMultiple('streets',$orderby,'* ');

//Eindeutige Einsatz ID
$mission_id = $db->getLastMissionId(); 

$date = date("Y-m-d H:i:s");
//Seite Zusammenbauen
foreach($streets as $street) {

$sstreet .= '<option data-tokens="'.$street['street'].'" value="'.$street['street'].'">'.$street['street'].'</option>'; 
 }
 
  $tpl->load("newmission.tpl");
  $tpl->assign( "pagetitle",  'FW Zweibrücken - Neuer Einsatz');
  $tpl->assign( "name", $_SESSION['name'] );
  $tpl->assign( "links", $db->links($_SESSION['role']));
  $tpl->assign( "date", $date );
  $tpl->assign( "sstreets", $sstreet );
  $tpl->assign( "uid", $_SESSION['userid']);
  $tpl->assign( "username",  $mission_id);        
  $tpl->assign( "id",  $mission_id); 
  
  $tpl->display();
 ?>  



