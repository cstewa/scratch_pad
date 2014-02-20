window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    @AllNotes = [
      new @Models.Note(id: 1, title: "Second todo note", content: "I am a note!")
      new @Models.Note(id: 2, title: "The second note", content: "") 
      new @Models.Note(id: 2, title: "The third note", content: "stuff")
    ]
    console.log new @Routers.ScratchPadRouter
    Backbone.history.start(pushState: true)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
