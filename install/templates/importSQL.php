<h3>SQL Import</h3>

<p>Beispieldaten und Admin Benutzer werden installiert...</p>
<hr>

<?php if (count($errors) > 0) { ?>
	<div class="error">SQL Import Fehlgeschlagen!</div>
	
	<ul>
		<?php foreach ($errors as $error): ?>
			<li><?php echo $error; ?></li>
		<?php endforeach; ?>
	</ul>
<?php } else { ?>
	<div class="success">SQL Import abgeschlossen!</div>
<?php } ?>

<hr>

<a href="index.php" class="button negative">
	<img src="css/blueprint/plugins/buttons/icons/cross.png" alt=""/> Abbrechen
</a>

<?php if (count($errors) == 0) { ?>
	<form method="post">
		<input type="hidden" name="nextStep" value="done">
		<button type="submit" class="button positive">
			<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> Weiter
		</button>
	</form>
<?php } else { ?>
	<form method="post">
		<input type="hidden" name="nextStep" value="importSQL">
		<button type="submit" class="button positive">
			<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> Wiederholen
		</button>
	</form>
<?php } ?>