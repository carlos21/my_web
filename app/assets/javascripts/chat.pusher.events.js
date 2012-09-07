$(document).ready(function(){
  //Pusher.channel_auth_endpoint = '/api/authenticate?user_id=' + user_id;
  var socket = new Pusher(PUSHER_KEY);
  
  // Global variable "channel" is set in the view
  var publicChannel = socket.subscribe(channel);

  // Deal with incoming messages!
  publicChannel.bind('receive_message', function(message) {
    $('#chat-messages').append("<div class='msg'><div class='msg-user'>" + message.user.nickname + " said:</div><div class='msg-description'>" + message.description + "</div></div>");
  });

  publicChannel.bind('typing_status', function(notification) {
    if(notification.user.id == user_id) return false;
    if(notification.status == 'true') {
      $("#chat-is-typing").css("display", "block");
      $("#chat-is-typing").html(notification.user.nickname + ' is typing ...');
    } else {
      $("#chat-is-typing").css("display", "none");
      $("#chat-is-typing").html('');
    }
  });

});
