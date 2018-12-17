<form class="form-signin" action="{action}" method="post" action="">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" name="street" placeholder="Straße*" value="{street}" required>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" name="plz" placeholder="PLZ" value="{plz}" required>
    </div>
    <div class="col">
      <input type="text" class="form-control" name="ort" placeholder="Ort" value="{ort}">
    </div>
  </div>
  
<div class="row">
  <div class="col"><input type="hidden" name="insert">
  {savebutton}
  {abortbutton}
 </div></div>
</form>