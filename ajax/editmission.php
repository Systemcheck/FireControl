<div style="padding:10px">

<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
$action = $_GET['action'];
if($action == 'delete') { $db->delete('missions', $_GET['item']); echo "Datensatz gelöscht"; }


if($_GET['action'] == 'edit') { $mdetails = $db->getMissionDetails($_GET['item']); 
echo $_GET['item'];
$edit = '
<form action="" method="post"> 
 <table class="table">
  <tbody>
    <tr>
      <th scope="row">Einsatzart</th>
        <td>
          <div class="col-sm-8 form-group">                
          <input type="text" name="name" class="form-control" id="name" value="'.$mdetails['name'].'">
          </div>
        </td>
      </tr>
      <tr>
      <th scope="row">Adresse</th>
      <td>
      <div class="col-sm-8 form-group">
        <input type="text" class="form-control" placeholder="Adresse" name="adress" id="adress" data-live-search="true" value="'.$mdetails['adress'].'">
        </div>
      </td>
      
    </tr>
    <tr>
      <th scope="row">Beschreibung</th>
      <td>
      
           <div class="col-sm-8">
          <input type="text" name="description" placeholder="Bemerkung zum Einsatz" class="form-control" id="description" value="'.$mdetails['description'].'"></td>
          </div>                                                                                                    
    </tr>
    
      <tr>
      
      <td><div class="col-sm-8 form-group">
      <input type="hidden" name="id" class="form-control" id="id" value="'.$_GET['item'].'">
      <button id="savemission" class="btn btn-success">Speichern</button>
      </div>
      </td>
      
    </tr>
  </tbody>
</table></form>';  }


if($action == 'edit') { echo $edit; }




?>



</div>
<script>
$( "button#savemission" ).click(function() {
$.ajax({
  method: "POST",
  url: "ajax/savemission.php",
  data: { id: $("#id").val(), name: $( "input#name" ).val(), adress: $( "input#adress" ).val(), description: $( "input#description" ).val() }
})
  .done(function( msg ) {
    loadMissions();
   
  });
});

</script>