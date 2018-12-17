<form class="form-signin" action="?login=1" method="post">
      
      
      <div class="alert"><?php if(isset($errorMessage)) {     echo $errorMessage; }  ?></div>
      <label for="inputText" class="sr-only">Benutzer</label>
      <input type="text" id="inputText" class="form-control" placeholder="Benutzer" name="username" autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Passwort" name="passwort">
      
      <button class="btn btn-lg btn-danger btn-block" type="submit">Anmelden</button>
      
    </form>