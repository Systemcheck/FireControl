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

if(isset($_GET['action']) && $_GET['action'] == 'delete' ) { $db->delete('missions',$_GET['item']); header("Location: overview.php", true, 301); }

$mission_status     = '';
$mission_status     = $db->getConfig('mission');
//$mission_status     = $mission_status['wert'];
$missionfields      = 'id,name,description,adress,number,DATE_FORMAT(created_at,"%d.%m.%Y-%H:%i") as protokolldate ';
$orderby            = ' ORDER BY `id` DESC';
$missions           = $db->selectMultiple('missions',$orderby,$missionfields);
$cars = $db->getAllCar();

$mission_id = $db->getLastMissionId();

//Seitenkonfiguration
$pagetitle = "Übersicht - Einsatzdokumentation";
$publishertabs  = array("Übersicht","Fahrzeugübersicht","Telefonnummern");
$modtabs  = '';
$admintabs = '';
if($_SESSION['role'] >= '16') { $admintabs = ',Benutzer';}
$tabs = $publishertabs;

//Seite Zusammenbauen
$tpl->load('header.tpl');
$tpl->assign('pagetitle', 'FW Zweibrücken - Übersicht');
$tpl->display();
$tpl->load('navbar.tpl');
$tpl->assign( "name", $_SESSION['name'] );
$tpl->assign( "links", $db->links($_SESSION['role']));
$tpl->assign( "uid", $_SESSION['userid']);
$tpl->assign( "username",  $mission_id);        
$tpl->assign( "id",  $mission_id);
$tpl->display();

    
if(isset($_GET['message'])) {
  $message = $_GET['message'];
  $message = '<div class="alert alert-success" role="alert">' . $message . '</div>';
  echo $message;
  }
 ?>  
  <h2>Einsatz neu anlegen, abschließen oder drucken</h2>
  <p>Um einen neunen Einsatz anzulegen, klicken Sie bitte auf "Neuer Einsatz".</p>

<?php include('templates/navtabs.tpl.php'); ?>

  <div class="tab-content">
    <div id="Übersicht" class="tab-pane fade in active">
      <?php if($mission_status == 1 ) { ?>
      <h3>Einsatz (ID: <?php echo $mission_id; ?>) wurde gestartet.</h3>
      
      <p>
      <a href="protocol.php?missionid=<?php echo $mission_id; ?>" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> Zum Einsatz</a>
      <a href="overview.php?stopmission=1" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Einsatz Beenden</a></p>
      <?php } else { ?> 
      <h3>Einen neuen Einsatz anlegen</h3>
      <p><a href="newmission.php?startmission=true" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Neuer Einsatz</a></p>
      <?php } ?>
      <h3>Bestehende Einsätze</h3>
        <p><div id="missioncontainer">
        <?php
        $i = 0;
        $fields = array("#", "Einsatz", "Bemerkung", "Adresse", "Haunummer", "Datum", "Aktionen");
        
        include('templates/table.tpl.php'); 
        ?>
        </div></p>
    </div>
    <div id="Fahrzeugübersicht" class="tab-pane fade">
      <h3>Fahrzeugübersicht</h3>
      <p>
      <a href="ajax/editcar.php?action=new&table=cars" data-toggle="modal" data-target="#newcar" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Neues Fahrzeug</a>
      <?php if($_SESSION['role'] >= 16) { ?><a href="#" data-toggle="modal" data-target="#uploadcars" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-upload" aria-hidden="true"></span> Fahrzeug Upload</a>
        <?php }  $fields = array("#", "Funkkenner", "Fahrzeug", "Besatzung", "Organisation"); ?>
          <table class="table table-hover">
  <thead>
    <tr>
    <?php foreach($fields as $field) { ?>
      <td scope="col"><?php echo $field; ?></td>
    <?php }
     if($_SESSION['role'] >= '16') { ?>
    <td>Aktion</td>
    
    <?php } ?>  
    </tr>
  </thead>
  <tbody id="carcontainer">                   <!-- ajax/loadcars.php-->
  </tbody>
    </table>   
     </p>
    </div>
    <?php
 $tpl->load("telefonnummern.tpl.php");
 $tpl->assign("id", "Telefonnummern");  
 $tpl->display();   
 ?> 
    
  </div>
  
<?php
//Fahrzeug bearbeiten
foreach($cars as $car) {
$okbutton = '<a href="?action=deletecar&uid='.$car['id'].'" class="btn btn-danger btn-sm">Löschen</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', 'Einsatz löschen');
$tpl->assign('target', 'editcar_'.$car['id']);
$tpl->assign('modalbody', 'Fahrzeug '.$car['funk'].' wirklich löschen?');
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();
}

//Fahrzeug Upload
$okbutton = '<button type="button" class="btn btn-primary btn-sm" id="carupload" >Upload</button>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', 'Fahrzeug Upload');
$tpl->assign('target', 'uploadcars');
$tpl->assign('modalbody', file_get_contents('templates/cars.upload.tpl'));
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();

//Neues Fahrzeug
$title = 'Fahrzeug anlegen';
$target = 'newcar';
include('templates/modal.tpl.php');
$title = 'Fahrzeug löschen';
$target = 'deletecar';
include('templates/modal.tpl.php');

//Fahrzeuge löschen
foreach($cars as $car) {
$okbutton = '<a href="?action=deletecar&uid='.$car['id'].'" class="btn btn-danger btn-sm">Löschen</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', 'Einsatz löschen');
$tpl->assign('target', 'deletecar_'.$car['id']);
$tpl->assign('modalbody', 'Fahrzeug '.$car['funk'].' wirklich löschen?');
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();

}

foreach($missions as $value) {
$title = 'Einsatz bearbeiten';
$target = 'editmission_'.$value['id'];
include('templates/modal.tpl.php');
}
?>

<script type="text/javascript">



function loadMissions() {
  $("#missioncontainer").load("templates/table.tpl.php",function() {
    $(this).append();
    });
  }
function loadMissionCars() {
  $("#carcontainer").load("ajax/loadcars.php",function() {
    $(this).append();
    });
  }
loadMissionCars();
setInterval(function() {loadMissionCars()}, 3000);


  $("#overview").addClass("active")


</script>
<?php
include('templates/footer.tpl.php'); ?>
