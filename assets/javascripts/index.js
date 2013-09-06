function updateAfterDelete(event, data, status, xhr){
  console.log(event.target.id);
  console.log(event.target.className);
  $(this).html('<td colspan="5" class="msg">' + data + '</td>');
  updateMenu();
};

$(document).ready(function(){
  $("[id^=user-timetracker]").each(function(){
    $(this).on("ajax:success", updateAfterDelete);
    console.log(this);
  });
  
  $("[id^=all-timetracker]").each(function(){
    $(this).on("ajax:success", updateAfterDelete);
  });
});
