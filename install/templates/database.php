<h3>Datenbank Verbindung</h3>


<hr>

<?php if ($error) { ?>
	<div class="error">
		<b>Error establishing a database connection: <?php echo $error; ?></b><br><br>
		This either means that the username and password information is incorrect or we can't contact the database server at <?php echo $host; ?>. Maybe your host's database server is down.<br><br>
		
		<ul>
			<li>Are you sure you have the correct username and password?</li>
    		<li>Are you sure that you have typed the correct hostname?</li>
    		<li>Are you sure that the database server is running?</li>
		</ul>
		
		If you're unsure what these terms mean you should probably contact your host. 
	</div>
<?php } ?>

<form method="post">
	<p>
		<label>Datenbank Name </label> (Name der Datenbank)<br>
		<input class="title" type="text" name="database" value="<?php echo $database; ?>">
	</p>
	<p>
		<label>Username</label> (MySQL Benutzer)<br>
		<input class="title" type="text" name="username" value="<?php echo $username; ?>">
	</p>
	<p>
		<label>Passwort</label> (MySQL Passwort)<br>
		<input class="title" type="password" name="password" value="<?php echo $password; ?>">
	</p>
	<p>
		<label>Host</label> (z.B. "localhost")<br>
		<input class="title" type="text" name="host" value="<?php echo $host; ?>">
	</p>
	
	<hr>
	
	<?php if ($goToNextStep) { ?>
		<div class="success">Alles OK! Verbindung steht.</div>

		<a href="index.php" class="button negative">
			<img src="css/blueprint/plugins/buttons/icons/cross.png" alt=""/> Abbrechen
		</a>		
		
		<input type="hidden" name="nextStep" value="importSQL">
		<button type="submit" class="button positive">
			<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> Weiter
		</button>
	<?php } else { ?>
		<a href="index.php" class="button negative">
			<img src="css/blueprint/plugins/buttons/icons/cross.png" alt=""/> Abbrechen
		</a>
		
		<input type="hidden" name="nextStep" value="database">
		<button type="submit" class="button positive">
			<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> Verbindung prüfen!
		</button>
	<?php } ?>
</form>