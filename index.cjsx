{_} = window
Promise = require 'bluebird'
async = Promise.coroutine
#request = Promise.promisifyAll require 'request'
fs = require 'fs-extra'
REPORTER_VERSION = '2.4.0'

__ = window.i18n["poi-plugin-package-saver"].__.bind(window.i18n["poi-plugin-package-saver"])

SAVE_PATH = "d:/packages/";

saveToFile = async (e) ->
    {method, path, body, postBody} = e.detail
    {_teitokuId} = window
    timeStamp = new Date()

    fileName = SAVE_PATH + timeStamp 
    fs.write filleName, body 

module.exports =
  show: false
  pluginDidLoad: (e) ->
    window.addEventListener 'game.response', saveToFile
  pluginWillUnload: (e) ->
    window.removeEventListener 'game.response', saveToFile
  