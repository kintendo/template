# sends index.html to each connection
# ==============================================================================
http = require 'http'
fs = require 'fs'
express = require('express')
app = express()
server = http.createServer(app)    
io = require('socket.io').listen(server)
io.set('log level', 1)

app.get '/', (req, res) ->
	res.sendfile(__dirname + '/index.html')

server.listen process.env.PORT

# logic accessible by all sockets
# ==============================================================================

Test = require './test.coffee'

io.sockets.on 'connection', (socket) ->

	socket.on 'disconnect', () ->
		# do something
