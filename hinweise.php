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
$mission_id = $db->getLastMissionId(); 
if(isset($_GET['stopmission'])) { $db->stopMission($mission_id); 
    if($_GET['deletemission'] == 1) { 
    $id = $_GET['item'];
    
    $db->delete('missions',$id);
    header("Location: overview.php", true, 301); 
    } 
}
$tpl->load('header.tpl');
$tpl->assign('pagetitle', 'FW Zweibrücken - Hinweise');
$tpl->display();
$tpl->load('navbar.tpl');
$tpl->assign( "name", $_SESSION['name'] );
$tpl->assign( "links", $db->links($_SESSION['role']));
$tpl->assign( "uid", $_SESSION['userid']);
$tpl->assign( "username",  $mission_id);        
$tpl->assign( "id",  $mission_id);
$tpl->display();
$tpl->load('hinweise.tpl');
$tpl->display();
$tpl->load('footer.tpl');
$tpl->display();
?>

