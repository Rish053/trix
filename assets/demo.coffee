document.addEventListener "DOMContentLoaded", ->
  config =
    textarea: "text"
    toolbar: "toolbar"
    input: "data"
    debug: "debug"
    className: "formatted"

  window.controller = Trix.install(config)

Trix.delegate =
  fileAdded: (file, callback) ->
    console.log "Host delegate received file:", file
    console.log "Host delegate context:"
    console.dir this

    if /image/.test(file.type)
      setTimeout ->
        attributes = { url: "basecamp.png" }
        console.log "Host delegate calling back with attributes:", attributes
        callback(attributes)
      , 1000
    else
      console.log "Host delegate rejected non-image"
      false

  fileRemoved: (attributes) ->
    console.log "Host delegate received removed file attributes:", attributes
