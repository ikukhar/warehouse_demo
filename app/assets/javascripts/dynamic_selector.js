
$(document).ready(function(){
  
  function handler(selector_id, controller, elem){

    var id_value_string = elem.val();
    if (id_value_string == "") {
      $("select#"+selector_id+" option").remove();
      var row = "<option value=\"" + "" + "\">" + "" + "</option>";
      $(row).appendTo("select#"+selector_id);
    }
    else {
      $.ajax({
        dataType: "json",
        cache: false,
        url: '/'+controller+'/' + id_value_string,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
          alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
          $("select#"+selector_id+" option").remove();
          var row = "<option value=\"" + "" + "\">" + "" + "</option>";
          $(row).appendTo("select#"+selector_id);
          $.each(data, function(i, j){
            row = "<option value=\"" + j.id + "\">" + j + "</option>";
            $(row).appendTo("select#"+selector_id);
          });
        }
      });
    };
  }

  $("select#dynamic_warehouse_id").change(function(){
    handler("dynamic_sector_id", "warehouses", $(this));
  });

});
