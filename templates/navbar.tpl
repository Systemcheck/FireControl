<style>
.blink {
    animation:blinking 0.8s infinite;
}
@keyframes blinking{
    0%{     background-color: red;    }
    49%{    background-color: transparent; }
    50%{    background-color: transparent; }
    99%{    background-color: transparent;  }
    100%{   background-color: red;    }
}

.box__dragndrop,
.box__uploading,
.box__success,
.box__error {
  display: none;
}
</style>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Einsatzdokumentation - FW Zweibrücken</a>
    </div>
    <ul class="nav navbar-nav">
      {links}
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li class="logout">
        <a href="logout.php">
          <span class="glyphicon glyphicon-off"></span>
          <strong>Logout</strong>
        </a>
      <li>
      
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span> 
          <strong>{name}</strong>
        </a>
      </li>
    </ul>
  </div>
</nav>
<script>
function addMissionBlink() {
  $.get("ajax/checkmission.php", function(data, status){
        if (data == 1) {
        $("#mission").addClass("blink") }
        else { $("#mission").removeClass("blink"); }
    });
  }
addMissionBlink();
setInterval(function() { addMissionBlink()}, 3000);
 </script>