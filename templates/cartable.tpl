  <tr>
      <th scope="row">{funk}</th>
      <th>{name}</th>
      <td>{organisation}</td>
      <td><a href="#" id="agt_change_{id}" data-cid="{id}" data-staerke="{staerke}" data-name="{funk}" data-type="text" data-agt="{agt}" data-pk="1" data-title="AGT">{staerke}</a></td>
      <td><a href="#" id="agt_change_{id}_2" data-cid="{id}" data-staerke="{staerke}" data-name="{funk}" data-type="text" data-agt="{agt}" data-title="AGT">{agt}</a></td>
      <td>{ankunft}</td>
      <td>{standort}</td>
      <td>{delete}</td>
  </tr>
  <script>
  $( "#agt_change_{id}" ).click(function() {
  var agt = $(this).data("agt");
  var name = $(this).data("name");
  var staerke = $(this).data("staerke");
  var cid = $(this).data("cid");
  $("#agt_change_name").val(name);
  $("#agt_change_agt").val(agt);
  $("#agt_change_staerke").val(staerke);
  $("#agt_change_id").val(cid);
  $(".alert-agt-info").fadeIn("fast");
  
});

  $( "#agt_change_{id}_2" ).click(function() {
  var agt = $(this).data("agt");
  var name = $(this).data("name");
  var staerke = $(this).data("staerke");
  var cid = $(this).data("cid");
  $("#agt_change_name").val(name);
  $("#agt_change_agt").val(agt);
  $("#agt_change_staerke").val(staerke);
  $("#agt_change_id").val(cid);
  $(".alert-agt-info").fadeIn("fast");
  
});

</script>