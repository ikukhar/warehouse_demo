
$(document).ready(function(){
  $("select#item_cell_sector_warehouse_id").change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == "") {
      $("select#item_cell_sector_id option").remove();
      $("select#item_cell_sector_id").prop('disabled', 'disabled');
      $("select#item_cell_id option").remove();
      $("select#item_cell_id").prop('disabled', 'disabled');
      var row = "<option value=\"" + "" + "\">" + "" + "</option>";
      $(row).appendTo("select#item_cell_sector_id");
      $(row).appendTo("select#item_cell_id");
    }
    else {
      $.ajax({
        dataType: "json",
        cache: false,
        url: '/warehouses/' + id_value_string,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
          alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
          $("select#item_cell_sector_id option").remove();
          $("select#item_cell_sector_id").prop('disabled', false);
          $("select#item_cell_id option").remove();
          $("select#item_cell_id").prop('disabled', 'disabled');
          var row = "<option value=\"" + "" + "\">" + "" + "</option>";
          $(row).appendTo("select#item_cell_sector_id");
          $(row).appendTo("select#item_cell_id");
          $.each(data, function(i, j){
            row = "<option value=\"" + j.id + "\"> Сектор №" + j.number +"</option>";
            $(row).appendTo("select#item_cell_sector_id");
          });
        }
      });
    };
  });

  $("select#item_cell_sector_id").change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == "") {
      $("select#item_cell_id option").remove();
      $("select#item_cell_id").prop('disabled', 'disabled');
      var row = "<option value=\"" + "" + "\">" + "" + "</option>";
      $(row).appendTo("select#item_cell_id");
    }
    else {
      $.ajax({
        dataType: "json",
        cache: false,
        url: '/sectors/' + id_value_string,
        timeout: 2000,
        error: function(XMLHttpRequest, errorTextStatus, error){
          alert("Failed to submit : "+ errorTextStatus+" ;"+error);
        },
        success: function(data){
          $("select#item_cell_id option").remove();
          $("select#item_cell_id").prop('disabled', false);
          var row = "<option value=\"" + "" + "\">" + "" + "</option>";
          $(row).appendTo("select#item_cell_id");
          $.each(data, function(i, j){
            row = "<option value=\"" + j.id + "\"> Ячейка №" + j.number + "</option>";
            $(row).appendTo("select#item_cell_id");
          });
        }
      });
    };
  })

});
