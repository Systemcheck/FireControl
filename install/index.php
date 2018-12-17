<?php
	session_start();
	require("../config/config.php");
	echo $config['installed'];
	if($config['installed'] == 1 ){ header("Location: ../index.php", true, 301); }
	// show current step
	$nextStep = "introduction";
	if (isset($_POST['nextStep']))
		$nextStep = $_POST['nextStep'];
	
	
	// define vars
	$step = $nextStep;
	$header = $config['header'];
	$product = $introduction["product"];
	
	include("templates/header.php");
	include($nextStep.".php");
	include("templates/footer.php");
	