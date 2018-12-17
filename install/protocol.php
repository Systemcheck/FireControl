<?php
//Login Prüfung
session_start();
if(!isset($_SESSION['userid'])) {header("Location: index.php", true, 301);}

//Klassen und Konfiguration laden
require_once('configuration.php');
require_once('classes/Db.class.php');
require_once('classes/Forms.class.php');
require_once('classes/Template.class.php');

//Datenbankabfragen & Variablen
$db = new Db($options,$attributes);
if(isset($_GET['stopmission'])) { $db->stopMission(); header("Location: protocol.php", true, 301);} //Einsatz beenden
$mission_id = $db->getLastMissionId(); 
$mission_status   = '';
$mission_status   = $db->getConfig('mission');  //Status abfragen (1 = Einsatz läuft)
$carsfields       = '* ';
$orderby          = ' ORDER BY `funk` ASC';
$tcars           = $db->selectMultiple('cars',$orderby,$carsfields);  //Fahrzeugdatenbank auslesen
$getallcars     = $db->getAllCars();
//$missioncars    = $db->getMissionCars($mission_id);
$missioncardetails = $db->getMissionCarDetails($mission_id);
$orderby        = " Where id = ".$mission_id;
$einsatzinfos   = $db->selectMultiple('missions',$orderby,$carsfields); //Einsatzdetails - laufender Einsatz

foreach($einsatzinfos as $infos){}
 
  
//  $optioncars = array_diff($getallcars,$missioncars);

//Seite Zusammenbauen
$tpl = new Template();
$pagetitle = "Dokumentation - Einsatzdokumentation";
include('templates/header.tpl.php'); 
include('templates/navbar.tpl.php');   

//Auswertung "Neuer Einsatz"
if(isset($_GET['missionid'])) {
$fid      = $_GET['missionid'];
if(isset($_POST['name'])) {
$fdescription = $_POST['description'];
$fname    = $_POST['name'];
$falarmierung = $_POST['datetime'];
$fadress     = $_POST['adress'];
$fcreator     = $_POST['creator'];

$string = "`name` = '".$fname."',
          `description` = '".$fdescription."', 
          `adress` = '" . $fadress . "', 
          `created_at` = '" . $falarmierung . "', 
          `created_from` = '" . $_SESSION['name'] . "'";
$db->change("missions",$string,$fid); }
header("Location: protocol.php", true, 301);
} 
?>

<div class="container">
<h2>EINSATZ - <?php echo $infos['name']; ?></h2>
  <p></p>
        <div class="progress"  style="height:10px">
<div class="progress-bar bg-light" style="width:100%;height:10px"></div>
</div>  
  <ul class="nav nav-tabs">
    <li class="active" id="missionid" data-id="<?php echo $mission_id; ?>"><a data-toggle="tab" href="#home">Einsatztagebuch</a></li>
    <li><a data-toggle="tab" href="#menu1">Kräfteübersicht</a></li>
    <li><a data-toggle="tab" href="#menu2">Wichtige Telefonnummern</a></li>
    
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active" role="tabpanel" aria-labelledby="nav-home-tab">
      <p></p>
      
<h3>Dokumentation</h3>
<form id="mission_message">
   <div class="form-row">
      <div class="col-16 col-sm-2 form-group">
         <label>Melder</label>
         <input type="text" id="from" class="form-control" placeholder="">
      </div>
      
      <div class="col-16 col-sm-8 form-group">
         <label>Meldung</label>
         <input type="text" id="message" class="form-control" placeholder="">
      </div>
      <div class="col-16 col-sm-2 form-group">
         <label>Aktion</label>
         <button type="button" id="message_send" data-mission-id="<?php echo $mission_id; ?>" class="btn btn-success form-control">Hinzufügen</button>
          
                                                                
      </div>
   </div>

</form> 
<div class="success" id="success"></div>
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Zeit</th>
        <th scope="col">Eintrag</th>
        <th scope="col">Melder</th>
      </tr>
    </thead>
    <tbody id="messagecontainer">
    </tbody>
  </table>
</div>

<div id="menu1" class="tab-pane fade" role="tabpanel" aria-labelledby="nav-menu1-tab"> 
  <h3>Kräfteübersicht</h3>
  <form>
   <div class="form-row">
      <div class="col-sm-2 form-group">
         <label>Fahrzeug</label>
         <input type="text" style="width: 175px;" name="name" id="name" placeholder="z.B. 1/23/1">
         <input type="hidden" name="id" id="id" value="">
        </div>
        <div class="col-16 col-sm-2 form-group">
          <label>Organisation</label>
          <select class="selectpicker form-control" data-live-search="true" name="organisation" id="organisation">
  <option data-tokens="">Feuerwehr</option>
  <option data-tokens="">Rettungsdienst</option>
  <option data-tokens="">Polizei</option>
  <option data-tokens="">THW</option>
  <option data-tokens="">Sonstige</option>
</select>
      </div>
      <div class="col-16 col-sm-1 form-group">
         <label>Stärke</label>
         <input type="text" class="form-control" name="staerke" id="staerke" placeholder="0/1/8" value="0/1/8">
      </div>
      <div class="col-16 col-sm-1 form-group">
         <label>AGT</label>
         <input type="text" class="form-control" name="agt" id="agt" placeholder="4" value="4">
      </div>
      <div class="col-16 col-sm-2 form-group">
         <label>Ankunft</label>
         <input type="datetime" class="form-control" name="ankunft" id="ankunft" value="<?php echo date("H:i"); ?>">
                                                                
      </div>
      <div class="col-16 col-sm-2 form-group">
         <label>Standort</label>
         <select class="selectpicker form-control" name="standort" id="standort" data-live-search="true">
  <option data-tokens="">Einsatzstelle</option>
  <option data-tokens="">Bereitstellungsraum</option>
  </select>
      </div>
      <div class="col-16 col-sm-2 form-group">
         <label>Aktion</label>
         <button type="button" id="carform_send" data-mission-id="<?php echo $mission_id; ?>" class="btn btn-success form-control">Hinzufügen</button>
                                                                
      </div>
   </div>
</form> 
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Funk</th>
      <th scope="col">Fahrzeug</th>
      <th scope="col">Organisation</th>
      <th scope="col">Stärke</th>
      <th scope="col">AGT</th>
      <th scope="col">Ankunft</th>
      <th scope="col">Standort</th>    
    </tr>
  </thead>
  <tbody id="cars">
  <?php 
  
  foreach($missioncardetails as $car){
  $tpl->load("cartable.tpl.php");  
  $tpl->assign( "funk",  $car['name']);
  $tpl->assign( "name", $db->getCarDetail($car['carid'],'name'));
  $tpl->assign( "organisation", $car['organisation'] );
  $tpl->assign( "agt", $car['agt'] );
  $tpl->assign( "staerke", $car['staerke'] );
  $tpl->assign( "ankunft", $car['arrived'] );
  $tpl->assign( "standort", $car['standort'] );
  $tpl->display();
}
  
?>  
  </tbody>
</table>         
</div>
 <?php
  $tpl->load("telefonnummern.tpl.php");
  $tpl->assign("id", "menu2");   
  $tpl->display();   
 ?>   
  </div>
</div>
<script>
    var options = {

  url: function(phrase) {
    return "ajax/carsearch.php?phrase=" + phrase;
  },

  getValue: function(element) {
    return element.name;
  },
  
  
    
  preparePostData: function(data) {
    data.phrase = $("#name").val();
    return data;
  },
  

  ajaxSettings: {
    dataType: "json",
    method: "POST",
    data: {
      dataType: "json"
    }
  },
  
  list: {

		onSelectItemEvent: function() {
			var besatzung = $("#name").getSelectedItemData().besatzung;
      var organisation = $("#name").getSelectedItemData().organisation;
      var agt = $("#name").getSelectedItemData().agt;
      var id = $("#name").getSelectedItemData().id;
      $("#staerke").val(besatzung).trigger("change");
      $("#organisation").val(organisation).trigger("change");
      $("#agt").val(agt).trigger("change");
      $("#id").val(id).trigger("change");
      
		}, 
    },
  
  requestDelay: 400
  };

$("#name").easyAutocomplete(options);

  $( "button#carform_send" ).click(function() {
  $.ajax({
    method: "POST",
    url: "ajax/write_to_mission_cars.php",
    data: { missionid: $(this).data("mission-id"), staerke: $( "input#staerke" ).val(), agt: $( "input#agt" ).val(), 
          name: $( "#name" ).text(), carid: $( "#name" ).val(),organisation: $( "#organisation" ).val(), ankunft: $( "input#ankunft" ).val(),
          standort: $( "#standort" ).val()  }
  })
  .done(function( msg ) {
    alert( "Data Saved: " + msg );
   
  });
});


function loadMessages() {
  $("#messagecontainer").load("ajax/loadmessages.php",function() {
    $(this).append();
    });
  }
loadMessages();
setInterval(function() {loadMessages()}, 3000);

function loadCars() {
  $("#cars").load("ajax/loadmissioncars.php",function() {
    $(this).append();
    });
  }
loadCars();
setInterval(function() {loadCars()}, 3000);

$( "button#cars" ).click(function() {
  $( this ).toggleClass( "btn-secondary" );
  $( this ).toggleClass( "btn-success" );
});

$( "button#message_send" ).click(function() {
var text = 'test';
$.ajax({
  method: "POST",
  url: "ajax/write_to_cars.php",
  data: { missionid: $(this).data("mission-id"), message: $( "input#message" ).val(), from: $( "input#from" ).val() }
})
  .done(function( msg ) {
    alert( "Data Saved: " + msg );
   
  });
    });
    
    
</script>
<?php include('templates/modal.tpl.php'); ?>
<?php include('templates/footer.tpl.php'); ?>