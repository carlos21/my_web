// Enter key to send message

$(document).ready(function(){
  $('#message').keydown(function(e){    
    if (e.keyCode == 13) { send_message(); return false; }
  });
});
