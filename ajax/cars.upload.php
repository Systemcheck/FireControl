<?php
require_once('../configuration.php');
require_once('../classes/Db.class.php');
$db = new Db($options,$attributes);
 
 if(isset($_POST["import"])){
		
		$filename=$_FILES["file"]["tmp_name"];		
        echo $filename;
        
		 if($_FILES["file"]["size"] > 0)
		 {
		  	$file = fopen($filename, "r");
            $row = 1;
	        $db->deleteTable('cars');
            $a = 0;
            $b = 1;
            $c = 2;
            $d = 3;
            while (($data = fgetcsv($file, 1000, ";")) !== FALSE) {
                $num = count($data);
                echo "<p> $num fields in line $row: <br /></p>\n"; 
                
                var_dump($data);
                  
                    $columns = "`funk`, `name`, `besatzung_soll`, `organisation`";
                    $vals = "'".$data[$a]."', '".$data[$b]."', '".$data[$c]."', '".$data[$d]."'";
                    
                    $result = $db->insert('cars',$columns, $vals);
                   
                
                     $row++;
                     
               
            }
            
				
	         
			
	         fclose($file);	
             header("Location: ../overview.php#Fahrzeug%C3%BCbersicht?message=Fahrzeuge wurden eingetragen", true, 301);
		 }
	}	 
 
 
 ?>