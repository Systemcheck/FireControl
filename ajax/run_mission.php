<?php
if(!isset($_SESSION['userid'])) {header("Location: index.php", true, 301);}
if($_SESSION['role'] < 4) { header("Location: index.php", true, 301); }
//Klassen und Konfiguration laden
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new $db->updateConfig('mission','1');
>