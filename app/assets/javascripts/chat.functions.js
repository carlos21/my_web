var is_typing_currently = false;

// Enter key to send message
$(document).ready(function(){

  $("#chat").draggable();

  // adding keydown event
  $('#message').keydown(function(e){    
    if (e.keyCode == 13) { send_message(); return false; }
  });

  $("#chat-nickname input[name='input-nickname']").focusout(function(e){
    $.ajax({
      type: "POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: change_nickname_url,
      data: { "nickname": $(this).val() },
      success: function(response){
        
      }
    });
  });

  // adding typing status event
  var timout_function = function() {
    is_typing_currently = false;
    typing_status(false);
  }

  var typing_end_timeout;
  $('#message').keyup(function(){
    // Clear the timeout to stop annoying notifications coming every time you clear the field
    clearTimeout(typing_end_timeout);
    if($(this).val() == '' && is_typing_currently) {
      // Has stopped typing by clearing the field
      typing_end_timeout = setTimeout(timout_function, 1500);
    } else {
      // If your not currently typing then send the notification
      if(!is_typing_currently) { is_typing_currently = true; typing_status(true); }
    }
  });

  /*$("#chat-name").click(function(e){
    if($("#chat").css("display") == "none") {
      $("#chat").slideDown();
    } else {
      $("#chat").slideUp();
    }
  });*/

});

// Post a message to the server to be sent through Pusher
function send_message() { 
  var message = $('#message').val();
  // Validate Field
  if(message == '') {
    alert('Please enter a message...');
    $('#message').focus();
    return false;
  }
  
  // Reset the validation stuff
  $('#message').css({ color: '#000000' });
  
  // Post off to the server with the message and some vars!
  $.ajax({
    type: "POST",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url: post_message_url,
    data: { "chat_id": chat_id, "message": message },
    success: function(response){
      $('#message').val("");
    }
  });
  
}

// Post to the server about the current status of typing
function typing_status(status) {
  $.ajax({
    type: 'POST',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url: typing_status_url,
    data: {"status": status}
  });
}

function setChatVisibility(){
  if($("#chat-container").css('display') == 'block'){
    $("#chat-container").slideUp('slow');
    $("#chat-visibility a").html('Show');
  } else {
    $("#chat-container").slideDown('slow');
    $("#chat-visibility a").html('Hide');
  }
}

