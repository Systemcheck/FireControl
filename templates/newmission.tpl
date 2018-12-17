{include file="header.tpl"}
{include file="navbar.tpl"} 
<div class="container">
  <h2>Neuen Einsatz anlegen (ID: {id})</h2>
    <div class="">
      <div id="home" class="tab-pane fade in active">
        <h3>Einsatz Informationen:</h3>
        <form action="protocol.php?missionid={id}" method="post"> 
          <table class="table">
            <tbody>
              <tr>
                <th scope="row">Alarmierung</th>
                  <td>
                  <div class="col-16 col-sm-3 form-group">                
                  <input type="date" name="date" class="form-control" onInput="getdate();" id="date" placeholder="Datum">
                  </div>
                  <div class="col-16 col-sm-3 form-group">              
                  <input type="time" name="time" class="form-control" onInput="gettime();" id="time" placeholder="Zeit">
                  </div>
                  <div class="col-16 col-sm-4 form-group">
                  <input type="text" id="datetime" name="datetime" value="{date}" class="form-control readonly" readonly="" placeholder="Datum/Uhrzeit">
                  </div>
                </td>
              </tr>
              <tr>
              <th scope="row">Alarmstichwort</th>
                <td>
                <div class="col-16 col-sm-4 form-group">
                    <input type="text" name="name" placeholder="Alarm Stichwort" class="form-control" id="usr"></div>
                </td>
              </tr>
              <tr>
              <th scope="row">Einsatzort</th>
                <td>
                <div class="col-16 col-sm-2 form-group">
                <select name="adress" class="form-control selectpicker" data-live-search="true">
                <option data-tokens="auf" value="12">Bitte wählen</option>
                {sstreets}
                
                </select>
                </div>
                <div class="col-16 col-sm-2">
                <input type="text" name="number" placeholder="Hausnummer" class="form-control" id="usr">
                </div>
                <div class="col-16 col-sm-6">
                <input type="text" name="alt_adress" placeholder="Adresse alternativ" class="form-control" id="usr">
                </div>
                </td>
              </tr>
              <tr>
              <th scope="row">Bemerkung (intern)</th>
                <td>
                <div class="col-sm-7 form-group">
                <input type="text" name="description" class="form-control" id="description">
                </div>
                <div class="col-sm-3">
                <input type="text" name="creator" class="form-control" id="usr" readonly value="{username}">
                </div>
                </td>
              </tr>
              <tr>
              <th scope="row"></th>
                <td>  
                <div class="col-sm-3 form-group">
                <a href="overview.php?stopmission=1&deletemission=1&item={id}" class="btn btn-danger btn-md"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Einsatz abbrechen</a>
                </div>
                <div class="col-sm-4 form-group">
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> weiter zur Dokumentation</button>
                </div>
                </td>
              </tr>                    
            </tbody>
            </table></form>    
        </div>
      </div>
    </div>


<script>
var datetime = "";
function getcars() {
var car = $("select#selectedcars").children("option:selected").val();
$("#cars").append(car+";");
$("select#selectedcars").children("option:selected").remove();
}
function getdate() {
var mdate = document.getElementById("date").value;
var mtime = document.getElementById("time").value;
var datetime = mdate + " " + mtime;
document.getElementById("datetime").value = datetime;
}
function gettime() {
var mtime = document.getElementById("time").value;
var mdate = document.getElementById("date").value;
var datetime = mdate + " " + mtime;
document.getElementById("datetime").value = datetime;
}
</script>
{include file="footer.tpl.php"} 