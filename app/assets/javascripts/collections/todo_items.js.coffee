class App.Collections.TodoItems extends Backbone.Collection
  initialize: (data, options) ->
    @todoList = options.todoList

  url: => "/todo_items/#{@todoList.id}/todo_items"

  model: App.Models.TodoItem
