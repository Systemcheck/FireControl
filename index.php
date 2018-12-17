<?php
require_once('config/config.php');
require_once('configuration.php');
require_once('classes/Db.class.php');
$dbc = new DATABASE_CONFIG();

if($dbc->dbconfig['installed'] != 1) { 
    header("Location: install/", true, 301);
    die('Installation benötigt'); 
  }
session_start();  
if(isset($_SESSION['userid'])) {header("Location: overview.php", true, 301);
  exit();
  }

if(isset($_GET['message'])) {
  $message = $_GET['message'];
  $message = '<div class="alert alert-success" role="alert">' . $message . '</div>';
  }

if(isset($_GET['login'])) {
    $username = $_POST['username'];
    $passwort = $_POST['passwort'];
    $pdo = new PDO('mysql:host='.$dbc->dbconfig['host'].';dbname='.$dbc->dbconfig['database'], $dbc->dbconfig['login'], $dbc->dbconfig['password']);
    $statement = $pdo->prepare("SELECT * FROM ed_users WHERE username = :username");
    $result = $statement->execute(array('username' => $username));
    $user = $statement->fetch();
        
    //Überprüfung des Passworts
    if ($user !== false && password_verify($passwort, $user['passwort'])) {
        
        $_SESSION['userid'] = $user['id'];
        $_SESSION['role']   = $user['rechte'];
        $_SESSION['name']   = $user['vorname'].' '.$user['nachname'];
        $errormessage = print_r($_SESSION);
        header("Location: overview.php", true, 301);
    } else {
        $errorMessage = "Benutzername oder Passwort war ungültig<br>";
    }
    
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>FW Zweibrücken - Einsatzdokumentation</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>

  <body class="text-center">
     
    <form class="form-signin" action="index.php?login=1" method="post">
      <h1 class="h3 mb-4 font-weight-normal">Einsatzdokumentation</h1>  
      <img class="mb-4" src="images/iuk_logo.png" alt="">
      <h1 class="h3 mb-3 font-weight-normal">Bitte anmelden</h1>
      <?php if(isset($message)) { echo $message; } ?>
      <?php if(isset($errorMessage)) { echo '<div class="alert alert-danger" role="alert">' . $errorMessage . '</div'; }  ?>
      <label for="inputText" class="sr-only">Benutzer</label>
      <input type="text" id="inputText" class="form-control" placeholder="Benutzer" name="username" autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Passwort" name="passwort">
      
      <button class="btn btn-lg btn-danger btn-block" type="submit">Anmelden</button>
      
    </form>
  </body>
</html>
