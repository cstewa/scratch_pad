class App.Models.TodoItem extends Backbone.Model
  save: ->
    @collectoin.todoList.save()