class App.Views.Notes extends Backbone.View
  template: JST['notes/index']

  events:
    'update-sort': 'updateSort'

  initialize: ->
    @addActions = new App.Views.AddActions(collection: @collection)
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @renderNote)

  render: =>
    @$el.html(@template())
    @collection.forEach(@renderNote)
    @$el.append(@addActions.render().el)
    this

  renderNote: (note) =>
    view = new App.Views.ShowNote(model: note, tagName: 'li')
    @$('.notes').append(view.render().el)
    @$('.notes').sortable({
      tolerance: "pointer"
      update: (event, ui) ->
        ui.item.trigger('drop', ui.item.index())
    })

  updateSort: (event, model, position) ->
    this.collection.remove(model)

    this.collection.each (model, index) ->
      ordinal = index
      if index >= position
        ordinal += 1
      # model.set({"ordinal", ordinal})
      model.save({ordinal: ordinal})

    model.set("ordinal", position)

    this.collection.add(model, {at: position})
    model.save()

    this.render()







