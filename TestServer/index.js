
var http = require('http');

var server = http.createServer(function (req, res) {

  if (req.method === "GET") {

    res.writeHead(200);
    res.end();

  }

  if (req.method === "POST") {

    res.writeHead(200);
    res.end();

  }

});

server.listen(8080, function () {

});
