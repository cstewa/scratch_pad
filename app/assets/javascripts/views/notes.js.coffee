class App.Views.Notes extends Backbone.View
  template: JST['notes/index']

  events: 
    'click a': 'showNote'


  render: -> 
    @$el.html(@template(notes: @collection))
    this

  showNote: (e) -> 
    $this = $(e.currentTarget) #because this doesn't change in backbone, reassigning the element to what was clicked on 
    url = $this.attr("href")
    Backbone.history.navigate(url, trigger: true)
    false #same as prevent default to make this async