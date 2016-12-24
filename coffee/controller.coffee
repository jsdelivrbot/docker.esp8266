class Ctrl
  @headers:
    'Content-Type': 'application/json'

  @notFound: (res) ->
    res.writeHead 404, Ctrl.headers
    res.end()

  create: (req, res) ->
    Ctrl.notFound res

  find: (req, res) ->
    Ctrl.notFound res

  findOne: (req, res) ->
    Ctrl.notFound res

  update: (req, res) ->
    Ctrl.notFound res

  destroy: (req, res) ->
    Ctrl.notFound res

ap = new Ctrl()
ap.findOne = (req, res) ->
  wifi.getAPDetails (cfg) ->
    res.writeHead 200, Ctrl.headers
    res.end JSON.stringify cfg

sta = new Ctrl url: '/sta'
# get current station config details
sta.findOne = (req, res) ->
  wifi.getDetails (cfg) ->
    res.writeHead 200, Ctrl.headers
    res.end JSON.stringify cfg
# scan and list available ap to be connected
sta.find = (req, res) ->
  wifi.scan (aplist) ->
    res.writeHead 200, Ctrl.headers
    res.end JSON.stringify aplist
