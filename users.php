<?php
//Login und Rechte-Prüfung
session_start();
if(!isset($_SESSION['userid'])) {header("Location: index.php", true, 301);}
if($_SESSION['role'] < 16) { header("Location: index.php", true, 301); }

//Klassen und Konfiguration laden
require_once('configuration.php');
require_once('classes/Db.class.php');
require_once('classes/Template.class.php');

//Datenbankabfragen und -einträge
$db = new Db($options,$attributes);

if(isset($_POST['insert'])) {
$table = 'users';
$columns = "`username`, `passwort`, `vorname`, `nachname`, `rechte`";
$vals = "'".$_POST['username']."', '".password_hash($_POST['passwort'],PASSWORD_DEFAULT)."', '".$_POST['vorname']."', '".$_POST['nachname']."', '".$_POST['rechte']."'";
}

if(isset($_GET['action'])) {
  if( $_GET['action'] == 'edit') {
    $string = "`username` = '" . $_POST['username'] ."',
              `vorname`   = '" . $_POST['vorname']  ."', 
              `nachname`  = '" . $_POST['nachname'] . "', 
              `rechte`    = '" . $_POST['rechte']   . "'";
$db->change("users",$string,$_GET['uid']);
    
  }
  if( $_GET['action'] == 'delete') {
    $db->delete('users',$_GET['uid']);
    header("Location: users.php", true, 301);
  }
  if( $_GET['action'] == 'deactivate') {
    $db->deactivate($_GET['uid']);
    header("Location: users.php", true, 301);
  }
  if( $_GET['action'] == 'activate') {
    $db->activate($_GET['uid']);
    header("Location: users.php", true, 301);
  }
  if( $_GET['action'] == 'insert') {
    $db->insert($table,$columns,$vals);
    header("Location: users.php", true, 301);
  } 
}

$userfields = 'id,username,vorname,passwort,nachname,rechte,active ';
$orderby = ' ORDER BY `id` ASC';
$users = $db->selectMultiple('users',$orderby,$userfields);
$mission_id = $db->getLastMissionId(); 
$date = date("Y-m-d H:i:s");

//Seitenkonfiguration
$pagetitle = "Benutzerverwaltung - Einsatzdokumentation";
$fields  = array("#","Benutzer","Vorname", "Nachname", "Rechte", "Aktiv");



//Templates laden und Seite erstellen
$tpl = new Template();
$tpl->load('header.tpl');
$tpl->assign('pagetitle', 'Benutzerverwaltung');
$tpl->display();


// 2. Navigation Variablen
$tpl->load('navbar.tpl');
$tpl->assign( "name", $_SESSION['name'] );
$tpl->assign( "links", $db->links($_SESSION['role']));
$tpl->assign( "uid", $_SESSION['userid']);
$tpl->assign( "username",  $mission_id);        
$tpl->assign( "id",  $mission_id);
$tpl->display();



// 3. users.tpl Variablen
if($_SESSION['role'] >= '16') { 
    $admin_links = '<th>Bearbeiten</th>
    <th>(De)aktivieren</th>
    <th>Löschen</th>';
    }

?>
<h3>Benutzerverwaltung</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Benutzer</th>
      <th scope="col">Vorname</th>
      <th scope="col">Nachname</th>
      <th scope="col">Rechte</th>
      <th scope="col">Aktiv</th>
      <?php echo $admin_links; ?>  
    </tr>
  </thead>
  <tbody id="carcontainer"> 
  
    


<?php
foreach($users as $value) {
if($value['active'] == 1) { $deactivate_button = '<td><button type="button" class="btn btn-danger btn-md" data-toggle="modal" data-target="#deactivateuser_'.$value['id'].'"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></button></td>';}
if($value['active'] == 0) { $deactivate_button = '<td><button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#activateuser_'.$value['id'].'"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></button></td>';}

$tpl->load('users.tpl');
$tpl->assign('admin_links',$admin_links);  
$tpl->assign('uid', $value['id']);
$tpl->assign('username',$value['username']);
$tpl->assign('vorname',$value['vorname']); 
$tpl->assign('nachname',$value['nachname']);
$tpl->assign('rechte',$value['rechte']); 
$tpl->assign('active',$value['active']);
$tpl->assign('deactivate_button',$deactivate_button);
$tpl->display(); 
}
?>

    </tr>
  </tbody>
</table>
<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#adduser"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Neuer Benutzer</button>


<?php  

//Neuer Benutzer$title = 'Benutzer anlegen';
$target = 'adduser';
$modalbody = file_get_contents('templates/users.form.tpl');
$savebutton = '<button type="submit" class="btn btn-primary">Speichern</button>';
$okbutton = '';
$cancelbutton = '';
$abortbutton =  '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', 'Neuer Benutzer');
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

//Benutzer bearbeiten
$edittpl = new Template;
foreach($users as $value) { 
$edittpl->load('modal.tpl');
$edittpl->assign('title', 'Benutzer bearbeiten');
$edittpl->assign('target', 'edituser_' . $value['id']);
$edittpl->assign('modalbody', file_get_contents('templates/users.form.tpl'));
$edittpl->assign('username', $value['username']);
$edittpl->assign('readonly', 'readonly');
$edittpl->assign('password', 'passwort');
$edittpl->assign('firstname', $value['vorname']);
$edittpl->assign('lastname', $value['nachname']);
$edittpl->assign('action', $_SERVER['PHP_SELF'].'?action=edit&uid='.$value['id']);
$edittpl->assign('savebutton', '<button type="submit" class="btn btn-primary">Speichern</button>');
$edittpl->assign('abortbutton', '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>');
$edittpl->assign('okbutton', '');
$edittpl->assign('cancelbutton', '');
$edittpl->display();
}

//Benutzer löschen
foreach($users as $value) {  
$title = 'Löschen bestätigen';
$target = 'deleteuser_'.$value['id'];
$modalbody = 'Benutzer ' . $value['username'] . ' wirklich löschen?';
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

//Benutzer deaktivieren
foreach($users as $value) {  
$title = 'Benutzer deaktivieren';
$target = 'deactivateuser_'.$value['id'];
$modalbody = 'Benutzer ' . $value['username'] . ' wirklich deaktivieren?';
$okbutton = '<a href="?action=deactivate&uid='.$value['id'].'" class="btn btn-danger btn-sm">Deaktivieren</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', $title);
$tpl->assign('target', $target);
$tpl->assign('modalbody', $modalbody);
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();
}

//Benutzer Aktivieren
foreach($users as $value) {  
$title = 'Benutzer Aktivieren';
$target = 'activateuser_'.$value['id'];
$modalbody = 'Benutzer ' . $value['username'] . ' wirklich aktivieren?';
$okbutton = '<a href="?action=activate&uid='.$value['id'].'" class="btn btn-success btn-sm">Aktivieren</a>';
$cancelbutton = '<button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>';
$tpl->load('modal.tpl');
$tpl->assign('title', $title);
$tpl->assign('target', $target);
$tpl->assign('modalbody', $modalbody);
$tpl->assign('okbutton', $okbutton);
$tpl->assign('cancelbutton', $cancelbutton);
$tpl->display();
}

//jQuery und Footer laden
$tpl->load('users.jquery.tpl');
$tpl->display();
$tpl->load('footer.tpl');
$tpl->display();
?> 