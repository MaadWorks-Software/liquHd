###
  Author: Devon J Weaver
  Date: 3/12/2012
  Project: liquHd

 simple http server to read html files from path provided
 runs only html/css/javascript client side
###

http = require 'http'
url = require 'url'
fs = require 'fs'
path = require 'path'

start = (port) ->
  httpServer = http.createServer (request, response) ->

    data = ''

    pathname = url.parse(request.url).pathname.replace /^\//, './'
    extname = path.extname pathname

    contentType = 'text/html'
    contentType = 'text/css' if extname is '.css'
    contentType = 'text/javascript' if extname is '.js'


    fs.readFile pathname, (err, data) ->
      if err
        response.writeHead 404,
          "Content-Type" : 'text/html'
        response.end "<h1>404 no file found!!!!</h1>"
      else
        response.writeHead 200,
          "Content-Type" : contentType

        response.write data
        response.end()

  console.log "Starting the website server on port: #{port}"
  httpServer.listen port

exports.start = start

