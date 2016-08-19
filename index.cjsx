{_} = window
Promise = require 'bluebird'
async = Promise.coroutine
#request = Promise.promisifyAll require 'request'
fs = require 'fs-extra'

__ = window.i18n["poi-plugin-package-saver"].__.bind(window.i18n["poi-plugin-package-saver"])

SAVE_PATH = "d:/packages/"

saveToFile = async (e) ->
    {method, path, body, postBody} = e.detail
    {_teitokuId} = window
    timeStamp = Date.now()
    package_type = path.split("/").slice(-1)[0];
    fileName = SAVE_PATH + timeStamp + "_" + package_type
    
    try
      yield fs.writeJSONAsync fileName, e.detail
    catch err
      console.log err

module.exports =
  show: false
  pluginDidLoad: (e) ->
    window.addEventListener 'game.response', saveToFile
  pluginWillUnload: (e) ->
    window.removeEventListener 'game.response', saveToFile
  