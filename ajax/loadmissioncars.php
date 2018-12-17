<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) { echo 'error'; }

//Klassen und Konfiguration laden
require_once('../configuration.php');
require_once('../classes/Db.class.php');
require_once('../classes/Template.class.php');
$db = new Db($options,$attributes);
$tpl = new Template();
$mission_id = $db->getLastMissionId(); 

$missioncardetails = $db->getMissionCarDetails($mission_id);

foreach($missioncardetails as $car){
$delete = '<a href="protocol.php?mission_id='.$mission_id.'&funk='.$car['funk'].'&deletecarfrommission=1&item='.$car['id'].'" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Einsatz Beenden</a>';
$change = '<a href="ajax/editmissioncar.php?mission_id='.$mission_id.'&funk='.$car['funk'].'&id='.$car['id'].'"" data-toggle="modal" data-target="edit_missioncar_'.$car['id'].'" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Bearbeiten</a>';
$tpl->loadfromajax("cartable.tpl");  
$tpl->assign( "funk",  $car['funk']);
$tpl->assign( "id",  $car['id']);
$tpl->assign( "name", $db->getCarDetail($car['carid'],'name'));
$tpl->assign( "organisation", $car['organisation'] );
$tpl->assign( "agt", $car['agt'] );
$tpl->assign( "staerke", $car['staerke'] );
$tpl->assign( "ankunft", $car['arrived'] );
$tpl->assign( "standort", $car['standort'] );
$tpl->assign( "change", $change );
$tpl->assign( "delete", $delete );
$tpl->display();

echo 'hier';
include('../templates/modal.tpl');

$tpl->loadfromajax("modal.tpl");
$okbutton = '<a href="?action=deletecar&uid='.$car['id'].'" class="btn btn-danger btn-sm">Löschen</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';

$tpl->assign('title', 'Besatzung Bearbeiten');
$tpl->assign('target', 'edit_missioncar_'.$car['id']);
$tpl->assign('modalbody', 'Fahrzeug '.$car['funk'].' wirklich löschen?');
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display(); 


}


?>