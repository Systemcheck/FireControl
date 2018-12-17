<div style="padding:10px">

<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
$action = $_GET['action'];
if($action == 'delete') { $db->delete('cars', $_GET['item']); 
echo 'Fahrzeug wurde gelöscht. <button type="button" class="btn btn-secondary" data-dismiss="modal"> OK</button>';
}


if($_GET['action'] == 'edit') { $cardetails = $db->getCarDetails($_GET['item']); 

$edit = '<form action="" method="post"> 
 <table class="table">
  <tbody>
    <tr>
      <th scope="row">Funkkenner</th>
        <td>
          <div class="col-16 col-sm-8 form-group">                
          <input type="text" name="funk" class="form-control" id="funk" value="'.$cardetails['funk'].'">
          </div>
        </td>
      </tr>
      <tr>
      <th scope="row">Fahrzeug</th>
      <td>
      <div class="col-16 col-sm-8 form-group">
        <input type="text" class="form-control" placeholder="z.B. TLF" name="name" id="name" data-live-search="true" value="'.$cardetails['name'].'">
        </div>
      </td>
      
    </tr>
    <tr>
      <th scope="row">Maximale Besatzung</th>
      <td>
      
           <div class="col-16 col-sm-8">
          <input type="text" name="besatzung" placeholder="z.B. 0/1/2" class="form-control" id="besatzung" value="'.$cardetails['besatzung_soll'].'"></td>
          </div>                                                                                                    
    </tr>
    
    <tr>
      <th scope="row">Organisation</th>
      <td>
      
           <div class="col-16 col-sm-8">
          <input type="text" name="organisation" placeholder="z.B. Feuerwehr" class="form-control" id="organisation" value="'.$cardetails['organisation'].'"></td>
          </div>                                                                                                    
    </tr>
    
      <tr>
      
      <td><div class="col-16 col-sm-4 form-group">
      <input type="hidden" name="id" placeholder="z.B. 0/1/2" class="form-control" id="id" value="'.$_GET['item'].'">
      <button id="savecar" class="btn btn-success">Speichern</button>
      </div>
      </td>
      
    </tr>
  </tbody>
</table></form>';  }

$new = '
<form action="" method="post"> 
 <table class="table">
  <tbody>
    <tr>
      <th scope="row">Funkkenner</th>
        <td>
          <div class="col-16 col-sm-8 form-group">                
          <input type="text" name="funk" class="form-control" id="funk" value="">
          </div>
        </td>
      </tr>
      <tr>
      <th scope="row">Fahrzeug</th>
      <td>
      <div class="col-16 col-sm-8 form-group">
        <input type="text" class="form-control" placeholder="z.B. TLF" name="name" id="name" data-live-search="true" value="">
        </div>
      </td>
      
    </tr>
    <tr>
      <th scope="row">Maximale Besatzung</th>
      <td>
      
           <div class="col-16 col-sm-8">
          <input type="text" name="besatzung" placeholder="z.B. 0/1/2" class="form-control" id="besatzung" value=""></td>
          </div>                                                                                                    
    </tr>
    <tr>
      <th scope="row">Organisation</th>
      <td>
      
           <div class="col-16 col-sm-8">
          <input type="text" name="organisation" placeholder="z.B. Feuerwehr" class="form-control" id="organisation" value=""></td>
          </div>                                                                                                    
    </tr>
    
      <tr>
      
      <td><div class="col-16 col-sm-4 form-group">
      <input type="hidden" name="id" placeholder="z.B. 0/1/2" class="form-control" id="id" value="">
      <button id="newcar" class="btn btn-success">Speichern</button>
      </div>
      </td>
      
    </tr>
  </tbody>
</table></form>';
if($action == 'edit') { echo $edit; }
if($action == 'new') { echo $new; }



?>



</div>
<script>
$( "button#savecar" ).click(function() {
$.ajax({
  method: "POST",
  url: "ajax/updatecar.php",
  data: { id: $("#id").val(), name: $( "input#name" ).val(), organisation: $( "input#organisation" ).val(), funk: $( "input#funk" ).val(), besatzung: $( "input#besatzung" ).val() }
})
  .done(function( msg ) {
    alert( "Data Saved: " + msg );
   
  });
    });
$( "button#newcar" ).click(function() {
$.ajax({
  method: "POST",
  url: "ajax/newcar.php",
  data: { name: $( "input#name" ).val(), organisation: $( "input#organisation" ).val(), funk: $( "input#funk" ).val(), besatzung: $( "input#besatzung" ).val() }
})
  .done(function( msg ) {
    alert( "Data Saved: " + msg );
   
  });
    });
</script>