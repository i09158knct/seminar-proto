SeminarProto.Views.GistEditor ||= {}

class SeminarProto.Views.GistEditor.FileView extends Backbone.View
  template: JST["backbone/templates/gist_editor/file"]

  className: "file well"

  readFileNameAndContent: ->
    fileName = @$(".file-name").val()
    content = @$(".file-content").val()

    @model.set(
      fileName: fileName
      content: content
    )

  render: ->
    @$el.html(@template())
    return this
