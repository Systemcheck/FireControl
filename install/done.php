<?php

	$furtherInstructions = file_get_contents("config/done.html");
	$template = file_get_contents("../config/config.php");
	$template = str_replace("%%installed%%", "1", $template);
	$file = "../config/config.php";
	file_put_contents($file, $template);

	include("templates/done.php");