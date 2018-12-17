<?php
//Login und Rechte-Prüfung
session_start();
if(!isset($_SESSION['userid'])) {header("Location: index.php", true, 301);}
if($_SESSION['role'] < 4) { header("Location: index.php", true, 301); }

//Klassen und Konfiguration laden
require_once('configuration.php');
require_once('classes/Db.class.php');
require_once('classes/Template.class.php');

//Datenbankabfragen und -einträge
$db = new Db($options,$attributes);

if(isset($_POST["import"])){		
		$filename=$_FILES["file"]["tmp_name"];		
        echo $filename;
        if($_FILES["file"]["size"] > 0)
		      {
		  	    $file = fopen($filename, "r");
            $row = 1;
	          $db->deleteTable('streets');
            $a = 0;
            $b = 1;
            $c = 2;
            $d = 3;
            while (($data = fgetcsv($file, 1000, ";")) !== FALSE) {
                $num = count($data);
                echo "<p> $num fields in line $row: <br /></p>\n"; 
                var_dump($data);
                $columns = "`street`, `plz`, `ort`";
                $vals = "'".$data[$a]."', '".$data[$b]."', '".$data[$c]."'";
                $result = $db->insert('streets',$columns, $vals);
                $row++;
                }
            fclose($file);	
            header("Location: streets.php?message=Adressen wurden eingetragen", true, 301);
		 }
	}	

if(isset($_GET['action'])) {
  if( $_GET['action'] == 'edit') {
    $string = "`street` = '" . $_POST['street'] ."',
              `plz`   = '" . $_POST['plz']  ."', 
              `ort`  = '" . $_POST['ort'] . "'";
$db->change("streets",$string,$_GET['uid']);
    
  }
  if( $_GET['action'] == 'delete') {
    $db->delete('streets',$_GET['uid']);
    header("Location: streets.php", true, 301);
  }
  
  if( $_GET['action'] == 'insert') {
    
  } 
}


$orderby = ' ORDER BY `street` ASC';
$streets = $db->selectMultiple('streets',$orderby,'* ');
$mission_id = $db->getLastMissionId(); 
$date = date("Y-m-d H:i:s");

//Seitenkonfiguration
$fields  = array("#","Straße","PLZ", "Ort");

//Templates laden und Seite erstellen
$tpl = new Template();
$tpl->load('header.tpl');
$tpl->assign('pagetitle', 'Adressenverwaltung');
$tpl->display();


// 2. Navigation Variablen
$tpl->load('navbar.tpl');
$tpl->assign( "name", $_SESSION['name'] );
$tpl->assign( "links", $db->links($_SESSION['role']));
$tpl->assign( "uid", $_SESSION['userid']);
$tpl->assign( "username",  $mission_id);        
$tpl->assign( "id",  $mission_id);
$tpl->display();



// 3. adress.tpl Variablen
if($_SESSION['role'] >= '16') { 
    $admin_links = '<th>Bearbeiten</th><th>Löschen</th>';
    }

?>
<h3>Adressverwaltung</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Straße</th>
      <th scope="col">PLZ</th>
      <th scope="col">Ort</th>
      <?php echo $admin_links; ?>  
    </tr>
  </thead>
  <tbody id="streetcontainer"> 
  
    


<?php
foreach($streets as $value) {

$tpl->load('streets.tpl');
$tpl->assign('admin_links',$admin_links);  
$tpl->assign('uid', $value['id']);
$tpl->assign('street',$value['street']);
$tpl->assign('plz',$value['plz']); 
$tpl->assign('ort',$value['ort']);


$tpl->display(); 
}
?>

    
  </tbody>
</table>
<form class="streetsupload col-sm-12" action="streets.php" method="post" enctype="multipart/form-data" style="display:none">
   <div class="form-row">
      <div class="col-sm-4 form-group">
      <label>CSV Datei</label>
      <input type="file" class="form-control" name="streets_upload" id="streets_upload" accept=".csv">
      </div>
      <div class="col-sm-2 form-group">
      <label>Upload</label>
      <button type="submit" class="btn btn-primary btn-sm form-control" id="update_streets"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Upload</button>
      </div>
       <div class="col-sm-2 form-group">
       <label>Abbrechen</label>
       <a href="#" class="btn btn-danger btn-sm form-control" id="close_streets"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Abbrechen</a>
       </div>
    </div>
</form>

<?php if($_SESSION['role'] >= 16) { ?>
<button type="button" class="btn btn-primary btn-md" id="streetsupload"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Adressen hochladen (csv)</button>
 <?php } ?>                                                                               

<?php  

//Neue Adresse;
$target = 'addstreet';
$modalbody = file_get_contents('templates/streets.upload.tpl');
$savebutton = '<button type="submit" class="btn btn-primary">Speichern</button>';
$okbutton = '';
$cancelbutton = '';
$abortbutton =  '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', 'Neue Adresse');
$tpl->assign('target', $target);
$tpl->assign('modalbody', $modalbody);
$tpl->assign('username', '');
$tpl->assign('password', '');
$tpl->assign('firstname', '');
$tpl->assign('lastname', '');
$tpl->assign('readonly', '');
$tpl->assign('action', $_SERVER['PHP_SELF'].'?action=insert');
$tpl->assign('savebutton', $savebutton);
$tpl->assign('abortbutton', $abortbutton);
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();

//Adresse bearbeiten
$edittpl = new Template;
foreach($streets as $value) { 
$edittpl->load('modal.tpl');
$edittpl->assign('title', 'Adresse bearbeiten');
$edittpl->assign('target', 'editstreet_' . $value['id']);
$edittpl->assign('modalbody', file_get_contents('templates/streets.form.tpl'));
$edittpl->assign('street', $value['street']);

$edittpl->assign('plz', $value['plz']);
$edittpl->assign('ort', $value['ort']);
$edittpl->assign('action', $_SERVER['PHP_SELF'].'?action=edit&uid='.$value['id']);
$edittpl->assign('savebutton', '<button type="submit" class="btn btn-primary">Speichern</button>');
$edittpl->assign('abortbutton', '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>');
$edittpl->assign('okbutton', '');
$edittpl->assign('cancelbutton', '');
$edittpl->display();
}

//Adresse löschen
foreach($streets as $value) {  
$title = 'Löschen bestätigen';
$target = 'deletestreet_'.$value['id'];
$modalbody = 'Adresse ' . $value['street'] . ' wirklich löschen?';
$okbutton = '<a href="?action=delete&uid='.$value['id'].'" class="btn btn-danger btn-sm">Löschen</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', $title);
$tpl->assign('target', $target);
$tpl->assign('modalbody', $modalbody);
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();
}
?>
<script>
  $( "#streetsupload" ).click(function() {
    $(".streetsupload").fadeIn("slow");
  });
  
  $( "#close_streets" ).click(function() {
    $(".streetsupload").fadeOut("slow");
  });
</script>

<?php
//jQuery und Footer laden

$tpl->load('streets.jquery.tpl');
$tpl->display();
$tpl->load('footer.tpl');
$tpl->display();
?> 