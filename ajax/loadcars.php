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
$cars = $db->getAllCar();
$anzahl = count($cars);
$i = 1;
foreach($cars as $car) {  ?>
          <tr>
            <td scope="row"><?php echo $i; ?></td>
            <td scope="row"><?php echo $car['funk']; ?></td>
            <td scope="row"><?php echo $car['name']; ?></td>
            <td scope="row"><?php echo $car['besatzung_soll']; ?></td>
            <td scope="row"><?php echo $car['organisation']; ?></td>
            <?php  
              $i++; if($_SESSION['role'] >= '16') { ?>
              <td>
              <a href="ajax/editcar.php?action=edit&table=cars&item=<?php echo $car['id']; ?>" data-toggle="modal" data-target="#editcar_<?php echo $car['id']; ?>" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Bearbeiten</a>
              <a href="ajax/editcar.php?action=delete&item=<?php echo $car['id']; ?>" data-toggle="modal" data-target="#deletecar_<?php echo $car['id']; ?>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Löschen</a>
              
              </td>
            <?php } ?>
          </tr>
          <?php } ?>

?>