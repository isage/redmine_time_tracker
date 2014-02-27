$(document).ready(function(){
//  $("[id^=user-timetracker]").each(function(){
//    $(this).on("ajax:success", updateAfterDelete);
//    console.log(this);
//  });
  
  $("[id^=all-timetracker]").each(function(){
    $(this).on("ajax:success", updateAfterDelete);
  });
});
