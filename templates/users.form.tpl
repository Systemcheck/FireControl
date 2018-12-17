<form class="form-signin" action="{action}" method="post" action="">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" name="username" placeholder="Benutzername*" value="{username}" required>
    </div>
    <div class="col">
      <input type="password" class="form-control" name="passwort" placeholder="Passwort*" value="{password}" {readonly}>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" name="vorname" placeholder="Vorname" value="{firstname}" required>
    </div>
    <div class="col">
      <input type="text" class="form-control" name="nachname" placeholder="Nachname" value="{lastname}">
    </div>
  </div>
  <div class="row">
  <div class="col">
  <select class="form-control" name="rechte">
  <option value="4">Benutzer</option>
  <option value="16">Administrator</option>
</select>
</div></div>
<div class="row">
  <div class="col"><input type="hidden" name="insert">
  {savebutton}
  {abortbutton}
 </div></div>
</form>