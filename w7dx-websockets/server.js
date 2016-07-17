var ws = require('ws').Server,
    server = new ws({port: 4000});

if(server) {
  console.log('server started');
}

server.on('connection', function(client) {
  console.log('connected');

  client.on('message', function(message) {
    var message = JSON.parse(message);
    console.log('received message:', message);

    switch(message.cmd) {
      case 'mousemove':
        server.clients.forEach(function(c) {
          c.send(JSON.stringify(message));
        });
      case 'message':
        // when server receive 'message' message
        // send it to all connected clients
        server.clients.forEach(function(c) {
          c.send(JSON.stringify(message));
        });
        break;
      case 'register':
        // when server receives 'register' message
        // store the name, and
        // send a message to all connected clients
        client.name = message.data.name;
        server.clients.forEach(function(c) {
          c.send(JSON.stringify({cmd: 'message',
                                 data: { value: client.name+' has entered',
                                 sender: 'system' }}));
        });
        break;
    }

  });

  client.on('close', function() {
    // when a client disconnects
    // send a message to all connected clients
    console.log('disconnected');
    server.clients.forEach(function(c) {
      c.send(JSON.stringify({cmd: 'message',
                             data: { value: client.name+' has left',
                                     sender: 'system' }}));
    });
  });

});
