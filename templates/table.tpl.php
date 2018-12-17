<table class="table table-hover">
  <thead>
    <tr>
    <?php foreach($fields as $field) { ?>
      <th scope="col"><?php echo $field; ?></th>
    <?php } ?>  
    </tr>
  </thead>
<tbody>
    <?php
    $row = 0;
    foreach ($missions as $value) {  ?>  
    <tr>
     
    <td scope="row"><?php echo $value['id']; ?></td>
    <th scope="row"><?php echo $value['name']; ?></th>
    <td scope="row"><?php echo $value['description']; ?></td>
    <td scope="row"><?php echo $value['adress']; ?></td>
    <td scope="row"><?php echo $value['number']; ?></td>
    <td scope="row"><?php echo $value['protokolldate']; ?></td>  
    <?php 
    if($_SESSION['role'] >= '4') { ?>
    <td><a href="print.php?item=<?php echo $value['id']; ?>" target="_blank" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Drucken</a></td>
    <?php }
    if($_SESSION['role'] >= '16') { ?>
    <td>
    <a href="ajax/editmission.php?action=edit&table=mission&item=<?php echo $value['id']; ?>" data-toggle="modal" data-target="#editmission_<?php echo $value['id']; ?>" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Bearbeiten</a>
    <a href="?action=delete&item=<?php echo $value['id']; ?>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Löschen</a>
    </td>
    
    <?php } ?>
    </tr>
    <?php } ?>
  </tbody>
</table>