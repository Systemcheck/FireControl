<?php
	$config['header'] = "Einsatzdokumentaion Installation";
	$config['applicationPath'] = "../";
	$config['database_file'] = "database.php";
	$config['installed'] ="1";
	
	//Site Links
  $links[] = array( 'name' => 'Übersicht', 'file' => 'overview.php');
  
  // INTRODUCTION
	$introduction = array();
	$introduction["product"] = "Einsatzdokumentation";
	$introduction["productVersion"] = "1.0.0";
	$introduction["company"] = "DR Creative";

	// SERVER REQUIREMENTS
	$requirements = array();
	$requirements["phpVersion"] = "5";
	$requirements["extensions"] = array("mysqli", "pcre");

	// FILE PERMISSIONS
	// r = readable, w = writable, x = executable
	$filePermissions = array();
	$filePermissions["install/database.php"] = "rw";
	$filePermissions["tmp"] = "rw";