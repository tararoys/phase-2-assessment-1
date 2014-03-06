$(document).ready(function(){
  $("#new_event").click(function(event){
    event.preventDefault();
    console.log('clicked')
    
    $.get( "/event/new", function( data ) {
        console.log(String(data));
        $( "#event_form" ).html( data );
    });
    
  });

  $("#event").on("submit", function(event){
    event.preventDefault();

    data = { 
      "event": {
        "user_id": $("#user_id").val(), 
        "name": $("#name").val(),
        "location": $("#location").val(),
        "starts_at": $("#starts_at").val(),
        "ends_at": $("#ends_at").val() }
    }

    $.post("/event/new", data, function(response){
      console.log("next: appending to this page");
      location.reload(true);
    })

  })

  // $("#ajaxified_form").on("submit", function(event){
  //   event.preventDefault();

  //   data = {
  //     "event_name": $("#event_name").val(),
  //     "location": $("#location").val(),
  //     "start_time": $("#start_time").val(),
  //     "end_time": $("#end_time").val()
  //   }

  //   $.post("/events/new", data, function(response){
  //     $(response).find(".single_event").last().appendTo('.all_events');
  //   });
  // });
});