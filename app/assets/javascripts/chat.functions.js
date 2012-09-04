$(document).ready(function(){
  //Pusher.channel_auth_endpoint = '/api/authenticate?user_id=' + user_id;
  console.log('User id: ' + user_id);
  console.log('Channel: ' + channel)

  var socket = new Pusher(PUSHER_KEY);
  console.log('Pusher Key: ' + PUSHER_KEY);
  
  // Global variable "channel" is set in the view
  var presenceChannel = socket.subscribe(channel);

  // Deal with incoming messages!
  presenceChannel.bind('receive_message', function(message) {
    $('#messages').text(message.description);
  });
});

// Post a message to the server to be sent through Pusher
function send_message() { 
  
  // Validate Field
  if($('#message').val() == '') {
    alert('Please enter a message...');
    $('#message').focus();
    return false;
  }
  
  // Reset the validation stuff
  $('#message').css({ color: '#000000' });
  
  // Set some vars
  var message = $('#message').val();
  
  // Post off to the server with the message and some vars!
  $.post('/api/post_message', 
    { "chat_id": chat_id, "message":message }, 
    function(response) {
      // When the response comes back, do some stuff to remove the "loading" UI
      $('#message').val("");
    }
  );
  
}