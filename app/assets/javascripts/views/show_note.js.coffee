class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']

  className: 'note'

  events:
    'click .edit-note': 'showNote'

  render: ->
    @$el.html(@template(note: @model))
    this

  showNote: ->
    Backbone.history.navigate(@model.url(), trigger: true)
    false