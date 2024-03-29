var path = require('path'),
		http = require('http'),
		paperboy = require('paperboy'),
		fs = require('fs'),
		PORT = 3000,
		WEBROOT = path.join(path.dirname(__filename), 'public');

http.createServer(function(req, res) {
  var ip = req.connection.remoteAddress;
	if (req.url === '/manifest.webapp') {
		res.setHeader('Content-Type', 'application/x-web-app-manifest+json');
		var stream = fs.createReadStream(__dirname+'/manifest.webapp', {
			'flags': 'r',
			'encoding': 'UTF-8'
		});
		stream.on('error', function (err) {
			console.log(err);
		});
		stream.pipe(res);
		return;
	}
  paperboy
		.deliver(WEBROOT, req, res)
		.addHeader('Expires', 300)
		.addHeader('X-PaperRoute', 'Node')
		.before(function() {
			console.log('Received Request');
		})
		.after(function(statCode) {
			log(statCode, req.url, ip);
		})
		.error(function(statCode, msg) {
			res.writeHead(statCode, {'Content-Type': 'text/plain'});
			res.end("Error " + statCode);
			log(statCode, req.url, ip, msg);
		})
		.otherwise(function(err) {
			res.writeHead(404, {'Content-Type': 'text/plain'});
			res.end("Error 404: File not found");
			log(404, req.url, ip, err);
		});
}).listen(PORT);

function log(statCode, url, ip, err) {
  var logStr = statCode + ' - ' + url + ' - ' + ip;
  if (err)
    logStr += ' - ' + err;
  console.log(logStr);
}

console.log('server started on port', PORT);
