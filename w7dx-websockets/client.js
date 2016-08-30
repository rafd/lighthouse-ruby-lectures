var chat = {
  // state
  _name: null,
  _connection: null,
  // misc
  _init: function(name) {
    chat._name = name;
    chat._showChat();
    // need to change the URL to an IP or domain
    // localhost will only work for testing on this machine
    chat._connection = new WebSocket("ws://localhost:4000");

    if (chat._connection) {

      chat._connection.onopen = function() {
        chat._connection.send(JSON.stringify({
          cmd: 'register',
          data: { name: chat._name }
        }));

        $('#composer').on('submit', function(e) {
          e.preventDefault();
          chat.sendMessage($("#message").val());
          $("#message").val("");
        });

        $(window).on('mousemove', function(e) {
          chat._connection.send(JSON.stringify({
            cmd: 'mousemove',
            data: { name: chat._name,
                    x: e.pageX,
                    y: e.pageY }
          }));
        });

      };
      chat._connection.onclose = function() {

      }
      chat._connection.onmessage = function(ev) {
        var message = JSON.parse(ev.data);
        switch(message.cmd) {
          case 'mousemove':
            var el = $("#pt-"+message.data.name);
            if(el.length == 0) {
              el = $("<div>").addClass("pointer").attr('id',"pt-"+message.data.name);
              el.appendTo("body");
            }
            el.css("left",message.data.x);
            el.css("top",message.data.y);

            break;
          case 'message':
            chat._displayMessage(message);
            break;
        }
      }
    }
  },
  // ui
  _showChat: function() {
    $("#login").hide();
    $("#chat").show();
  },
  _displayMessage: function(message) {
    var div = $("<div>").addClass("message").appendTo("#messages")
    $("<span>").addClass("sender").html(message.data.sender).appendTo(div)
    $("<span>").addClass("value").html(message.data.value).appendTo(div)
  },
  // public
  logIn: function(name) {
    if(name == '') {
      return false;
    }
    chat._init(name);
  },
  sendMessage: function(message) {
    if(message == '') {
      return false;
    }
    chat._connection.send(JSON.stringify({
      cmd: 'message',
      data: { value: message,
              sender: chat._name }
    }));
  }
}

$(function() {
  $('#login').on('submit', function(e) {
    e.preventDefault();
    chat.logIn($("#name").val());
  });
});
