<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db  = new Db($options,$attributes);
$mission_status     = $db->getConfig('mission');
echo $mission_status;
?>