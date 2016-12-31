http = global.require 'http'
wifi = global.require 'Wifi'
app = require './app.coffee'

mac = ->
  new Promise (resolve, reject) ->
    wifi.getAPIP (cfg) ->
      resolve cfg.mac

startAP = (opts)->
  new Promise (resolve, reject) ->
    wifi.startAP opts.ssid, password: opts.pwd, resolve

mac()
  .then (mac) ->
    "TT#{mac.split(':').join('')}"
  .then (ssid) ->
    startAP 
       ssid: ssid
       pwd: "12345678"
  .then ->
    http
      .createServer (req, res) ->
        app.process req, res
      .listen 80
