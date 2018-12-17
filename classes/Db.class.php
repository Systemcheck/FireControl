<?php

$dbc = new DATABASE_CONFIG();
$config = $dbc->dbconfig;
define('FETCH',PDO::FETCH_ASSOC);
define('SERVER', 'mysql:host='.$config['host'].';dbname='.$config['database']);
define('USER',$config['login']);
define('PW', $config['password']);
define('PREFIX',$config['praefix']);

$options = array(PDO::MYSQL_ATTR_INIT_COMMAND=>'Set Names utf8');
$attributes = array (
  'case'  => array(PDO::ATTR_CASE, PDO::CASE_NATURAL),
  'error' => array(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION)
  );
$order  = '';
$fields = '*';
$field  = '';

  
class Db extends PDO
 {
    private $sitelinks;
      
    public function __construct($options, $attributes) {
      
      parent::__construct(SERVER, USER, PW, $options);
      foreach ($attributes as $key => $value) {
        $this -> setAttribute($value[0], $value[1]);
        
      }
    }
    
    public function sitelinks() {
      $sitelinks[] = array('name' => 'Übersicht', 'file' => 'overview.php', 'id'=> 'overview');
      $sitelinks[] = array('name' => 'Adressen', 'file' => 'streets.php', 'id' => 'streets');
      //$sitelinks[] = array('name' => 'Übersicht', 'file' => 'overview.php');
      return $sitelinks;
    }
    
    public function adminlinks() {
      $adminlinks[] = array('name' => 'Benutzer', 'file' => 'users.php', 'id'=> 'userlink');
      $adminlinks[] = array('name' => 'Hinweise', 'file' => 'hinweise.php', 'id'=> 'hinweise');
      //$sitelinks[] = array('name' => 'Übersicht', 'file' => 'overview.php');
      return $adminlinks;
    }
    
    
    public function selectMultiple ($table,$order,$fields) {
      
      $query  = "SELECT " .  $fields ." FROM ". PREFIX . $table . $order;
      $stmt   =   $this->query($query);
      $result = $stmt->fetchAll(FETCH);
      return $result;
      }
      
    public function selectOne($table,$order,$field) {
      $query  = "SELECT " .  $field ." FROM ". PREFIX . $table . $order;
      $stmt   = $this -> query($query);
      $result = $stmt -> fetch(FETCH);
      return $result;
      }
      
    public function getConfig($field) {
      $query  = "SELECT wert FROM `". PREFIX ."config` WHERE name = '".$field."'";
      $stmt   = $this -> query($query);
      $result = $stmt -> fetch(FETCH);
      return $result['wert'];
    }
    
    public function updateConfig($name,$field,$value) {
      $query  = "UPDATE `". PREFIX ."config` SET `".$field."` = '".$value."' WHERE `name` = '".$name."'";
      return $this -> exec($query);
    }
    
    public function startMission() {
      $query  = "UPDATE `". PREFIX ."config` SET `wert` = '1' WHERE `name` = 'mission'";
      return $this -> exec($query);
      return $this -> insert('missions','name','Neuer Einsatz'); 
     }
    
    public function getLastMissionId() {  
      $query  = "SELECT id FROM `". PREFIX ."missions` ORDER BY `id` DESC LIMIT 0,1";
      
      $stmt   = $this -> query($query);
      $result = $stmt -> fetch(FETCH);
      return $result['id'];
    }
    
    public function stopMission() {
      $query  = "UPDATE `". PREFIX ."config` SET `wert` = '0' WHERE `name` = 'mission'";
      return $this -> exec($query);
    }
      
    public function change($table, $string, $id) {
      $where = " WHERE `id` = " . $id ;
      $query  = "UPDATE `". PREFIX . $table ."` SET " . $string. " " . $where;
      return $this -> exec($query);
    }
    
    public function deactivate($id) {
      $where = " WHERE `id` = " . $id ;
      $query  = "UPDATE ". PREFIX . "users SET active = 0" . $where;
      return $this -> exec($query);
    }
    
    public function activate($id) {
      $where = " WHERE `id` = " . $id ;
      $query  = "UPDATE ". PREFIX . "users SET active = 1" . $where;
      return $this -> exec($query);
    }
    
    
    public function insert($table, $columns,$vals) {
      $query = 'INSERT INTO '. PREFIX . $table.' ( '.$columns.' ) VALUES ( '.$vals.' )';
      $stmt = $this -> prepare($query);
      return $stmt -> execute();
      
    }
    
    public function delete($table, $id) {
      $query  = "DELETE FROM `". PREFIX . $table."` WHERE `id` = ".$id;
      return $this -> exec($query);
    }
    
    public function deleteTable($table) {
      $query  = "DELETE FROM `". PREFIX . $table."`";
      return $this -> exec($query);
    }

    public function getAllCars() {
      $carsfields =  "* ";
      $orderby          = ' ORDER BY `funk` ASC';
      $cars = $this->selectMultiple('cars',$orderby,$carsfields);
      foreach($cars as $car) {
        $acar[] = $car['funk'];
      }
      return $acar;
    }
    
    public function getAllCar() {
      $carsfields =  "* ";
      $orderby          = ' ORDER BY `funk` ASC';
      $cars = $this->selectMultiple('cars',$orderby,$carsfields);
        return $cars;
    }
    
    public function getAllJsonCars($like) {
      $carsfields =  "* ";
      $orderby          = " WHERE `funk` LIKE '%" . $like . "%' ORDER BY `funk` ASC";
      $cars = $this->selectMultiple('cars',$orderby,$carsfields);
        return $cars;
    }

    public function getMissionCars($id) {
      $carsfields =  "name ";
      $orderby        = " Where mission_id = ".$id;
      $cars = $this->selectMultiple("missioncars",$orderby,"name ");
      
      foreach($cars as $car) {
        $ecars[] = $car['name']; 
        
      }      
      return $ecars;
    }

    public function getMissionCarDetails($id) {
      $orderby        = " Where mission_id = ".$id;
      $cars = $this->selectMultiple("missioncars",$orderby,"* ");
        return $cars;
    }

    public function getCarDetail($id,$field) {
      $orderby  = " Where id = " . $id;
      $res      = $this->selectOne("cars", $orderby, $field);
        return $res[$field];
    }
    
    public function getCarDetails($id) {
      $orderby  = " Where id = " . $id;
      $res      = $this->selectOne("cars", $orderby, '*');
        return $res;
    }
    
    public function getMissionDetails($id) {
      $orderby  = " Where id = " . $id;
      $res      = $this->selectOne("missions", $orderby, '*');
        return $res;
    }

    public function getCarId($key, $value) {
      $orderby  = " Where " . $key . " = '" . $value . "'";
      $res      = $this->selectOne("cars", $orderby, '`id`');
        return $res['id'];
    }
    
    public function links($role = '') {
      $adminlink = '';
      $link = '';
      $newmission = $this->getConfig('mission');
      if($newmission == 1) {
        $newmissionlinks = '<li class="blink" id="mission">
                            <a href="protocol.php">Zum Einsatz</a></li><li class="">
                            <a href="overview.php?stopmission=1">Einsatz Beenden</a></li>'; } 
        else { 
        $newmissionlinks = '<li class=""><a href="newmission.php?startmission=true">Neuer Einsatz</a></li>'; }
        $sitelinks = $this->sitelinks();
        $adminlinks = $this->adminlinks();
        foreach($sitelinks as $sitelink) {
          $link .= '<li class="" id="'.$sitelink['id'].'"><a href="'.$sitelink['file'].'">'.$sitelink['name'].'</a></li>';
        }
        if($role >=16 ) {
        foreach($adminlinks as $sitelink) {
          $adminlink .= '<li class="" id="'.$sitelink['id'].'"><a href="'.$sitelink['file'].'" >'.$sitelink['name'].'</a></li>';
        }
        }
        return $link.$newmissionlinks.$adminlink; 
      }
    }

  
?>