SeminarProto.Views.GistsExplorer ||= {}

class SeminarProto.Views.GistsExplorer.GistsView extends Backbone.View
  template: JST["backbone/templates/gists_explorer/gists"]

  el: "#gists-explorer-gists"

  initialize: =>
    @options.gists.bind "reset", () =>
      @render()

  addAll: () =>
    @options.gists.forEach(@addOne)

  addOne: (gist) =>
    view = new SeminarProto.Views.GistsExplorer.GistView({model: gist})
    @$("tbody").append(view.render().el)

  render: ->
    @$el.html(@template())
    @addAll()

    return this
