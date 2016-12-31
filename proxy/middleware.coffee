module.exports =
  reqLogger: (req, res) ->
    req.on 'end', (data) ->
      console.log JSON.stringify req

  bodyParser: (req, res) ->
    req.on 'data', (data) ->
      req.body = JSON.parse data

  cors: (req, res) ->
    res.writeHead 200, 
      'Access-Control-Allow-Origin': '*'
      'Access-Control-Allow-Methods': 'OPTIONS, POST, GET, PUT, DELETE'
      'Access-Control-Allow-Headers': 'Content-Type'
      'Access-Control-Max-Age': 86400
    if req.method == 'OPTIONS'
      res.end()

  static: (req, res) ->
    files = require './static.coffee'
    if not req.url of files
      return
    ext = (path) ->
      ret = path.split '.'
      ret[ret.length - 1]
    switch ext req.url
      when 'html'
        res.writeHead 200, 'Content-Type': 'text/html'
      when 'js'
        res.writeHead 200, 'Content-Type': 'application/javascript'
    res.end atob files[req.url]

  '404': (req, res) ->
    res.notFound()

  '500': (req, res) ->
    res.serverError()

  '$custom': (req, res) ->
    return

  order: [
    'reqLogger'
    'bodyParser'
    'cors'
    '$custom'
    'static'
    '404'
    '500'
  ]
