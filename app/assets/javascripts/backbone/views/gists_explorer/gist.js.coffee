SeminarProto.Views.GistsExplorer ||= {}

class SeminarProto.Views.GistsExplorer.GistView extends Backbone.View
  template: JST["backbone/templates/gists_explorer/gist"]

  events:
    "click .gist-select": "select"

  tagName: "tr"

  select: (e) ->
    e.preventDefault()
    id = @model.get("id")
    description = @model.get("description")
    $("#answer_gist_id").val(id)

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this
