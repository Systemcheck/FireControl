<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$phrase = '';
if(isset($_GET['phrase'])) { $phrase = $_GET['phrase']; }
$db = new Db($options,$attributes);
$results = $db->getAllJsonCars($phrase);
$cars[] = array('name' => $_GET['phrase'], 'funk' => $_GET['phrase'], 'cname' => $_GET['phrase']);
foreach ( $results as $key => $value ) {
$cars[] = array('name' => $value['funk'] . ' ('.$value['name'].' )',
'id'  => $value['id'],
'besatzung' => $value['besatzung_soll'],
'agt'  => $value['agt_soll'],
'funk'  => $value['funk'],
'cname'  => $value['name'],
'organisation'  => $value['organisation']);

}
echo json_encode($cars);

