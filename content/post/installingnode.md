+++
date = 2014-06-27T17:50:06Z
draft = false 
title = "Installing Node"

+++

## Installing Nodejs
### Local machine
* Download [Nodejs](http://nodejs.org)
* The MSI installer should take care of anything including adding node to your path variable.
* To test your installation write a simple hello world web server

```
var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
```

* Run the server from command line

```
node path/to/server.js
```
