class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']

  className: 'note'

  initialize: ->
    @listenTo(@model, 'invalid', @addError)
    @listenTo(@model, 'error', @addError)
    @lastUpdated = new App.Views.LastUpdated(model: @model)

  events:
    'change': 'save'
    #only registers input change when its blurred
    'keydown .note-title': 'blurIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'
    'drop' : 'drop'

  render: ->
    @$el.html(@template(note: @model))
    @lastUpdated.setElement(@$('.normal-footer')).render()
    this

  remove: ->
    @lastUpdated.remove(arguments...)
    super(arguments...)

  save: ->
    @model.set
      title: @$('.note-title').val()
      content: @$('.note-content').val()
    @model.save()
    false

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  beginEditing: ->
    @$el.addClass('editing')
    @$el.removeClass('error')

  endEditing: ->
    @$el.removeClass('editing')

  addError: =>
    @$el.addClass('error')

  destroyNote: ->
    @model.destroy()
    @remove()
    false

  drop: (e, index) ->
    @$el.trigger('update-sort', [this.model, index])
