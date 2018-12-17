<h3>Vorwort</h3>

<p>Du bist dabei die <b><?php  echo $product; ?></b> (Version: <?php echo $productVersion; ?>) entwickelt von <b><?php echo $company; ?></b> zu installieren.</p>

<form method="post">
	<input type="hidden" name="nextStep" value="requirements">
	<button type="submit" class="button positive">
		<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> Start
	</button>
</form>
