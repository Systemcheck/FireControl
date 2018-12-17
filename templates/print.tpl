<!DOCTYPE html>
<html lang="de">
<head>
  <title>{pagetitle}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/navbar-login.css">
  <link rel="stylesheet" href="css/forms.scss">
  <link rel="stylesheet" href="js/autocomplete/easy-autocomplete.min.css"> 
  <script src="js/jquery-3.3.1.min.js"></script> 
  <script src="js/autocomplete/jquery.easy-autocomplete.min.js"></script> 
  <script src="js/bootstrap.min.js"></script>
</head>
<body style="padding-top: 10px;">
  <div class="container">
<h2>Einsatz: {einsatzart} - {adresse} {hausnummer}</h2>
Datum des Einsatzes: {protokolldatum} <br>
<br>
Besondere Bemerkungen: {bemerkung} <br>

<h3>Einsatzprotokoll</h3>      
{messages}
      <br>
Einsatz beendet am:<br>
-----------------------------------------------------<br><br><br><br><br>
Unterschrift:<br>
-----------------------------------------------------<br><br><br>      
      
    </div>
  </body>
</html>