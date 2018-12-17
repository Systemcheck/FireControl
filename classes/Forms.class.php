<?php
class Form {
  
  
  public function adminbuttons($style='',$link='') {
    return '<ul><a href="' . $link .'" class="btn btn-'. $style .' btn-sm">Benutzer Anlegen</a>';
  }
  
  public function generateForm($fields) {
    $form = '<form action="'  . $_SERVER['PHP_SELF']  .'" method="post">';
    
    foreach($fields as $field) {
      $form .= '<div class="form-group">
    <label for="exampleFormControlInput1">'.$field.'</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
  </div>';  
    }
    $form .= '<button class="btn btn-lg btn-danger btn-block" type="submit">Speichern</button></form>';
    return $form;
  }

}

?>