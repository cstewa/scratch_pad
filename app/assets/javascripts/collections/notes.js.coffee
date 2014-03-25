class App.Collections.Notes extends Backbone.Collection
  url: '/notes'
  model: App.Models.Note
  comparator: (model) ->
    return model.get('ordinal')

