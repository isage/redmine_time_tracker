function updateStatustransitionList(event, data, status, xhr){
  $("#status-transition-list").html(data);
};

$(document).ready(function(){
  $(document).on("ajax:success", "#status-transition-list", updateStatustransitionList)
  $(document).on("change", "[id^=new-transition]", function(){
    var href = $("#link-add-transition").prop("href");
    var from = $("#new-transition-from").prop("value");
    var to = $("#new-transition-to").prop("value");

    $("#link-add-transition").prop("href", href + "&from_id=" + from + "&to_id=" + to);
  });
});
