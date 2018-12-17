<?php

	$error = false;
	$goToNextStep = false;
	
	if (isset($_POST['database']))
	{
		$database = $_POST['database'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$host = $_POST['host'];
		
		// check connection
		// Verbindungscheck
        $connection = @new mysqli($host, $username, $password, $database);

        if ($connection->connect_error) {
        $error = $connection->connect_error;
	    exit();
        }
        
        
        
        
		if ($connection)
		{
			
			
			if (!$error)
			{
				// save settings in database config file
				// load template
				$template = file_get_contents("config/database_template.php");
				$template = str_replace("%%host%%", $host, $template);
				$template = str_replace("%%username%%", $username, $template);
				$template = str_replace("%%password%%", $password, $template);
				$template = str_replace("%%database%%", $database, $template);
				
                
				// write config file
                copy("config.dist.php","../configuration.php");
				$dbFile = '../configuration.php';
				file_put_contents($dbFile, $template);
				// save login in session for further use
				$_SESSION['db_host'] = $host;
				$_SESSION['db_user'] = $username;
				$_SESSION['db_pass'] = $password;
				$_SESSION['db_name'] = $database;
				
				// allow user to proceed
				$goToNextStep = true;
			}
			else $error = mysql_error();
		}
		else
			$error = mysql_error();
	}
	else
	{
		if (isset($_SESSION['db_host']))
		{
			$host = $_SESSION['db_host'];
			$username = $_SESSION['db_user'];
			$password = $_SESSION['db_pass'];
			$database = $_SESSION['db_name'];
		}
		else
		{
			$database = "";
			$username = "";
			$password = "";
			$host = "localhost";
		}
	}
		
	include("templates/database.php");