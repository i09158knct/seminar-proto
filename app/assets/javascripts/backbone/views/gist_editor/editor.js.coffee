SeminarProto.Views.GistEditor ||= {}

class SeminarProto.Views.GistEditor.EditorView extends Backbone.View
  template: JST["backbone/templates/gist_editor/editor"]

  events:
    "click #gist-editor-add-file": "addFile"
    "click #gist-editor-submit": "submit"

  el: "#gist-editor"

  initialize: ->
    @fileViews = []
    window.editor = @

    # @options.gists.bind "reset", () =>
    #   @render()

  addFile: ->
    gistFile = new SeminarProto.Models.GistFile
    @options.gistFiles.add(gistFile)

    fileView = new SeminarProto.Views.GistEditor.FileView({model: gistFile})
    @fileViews.push(fileView)
    @$("#gist-editor-files").append(fileView.render().el)

  submit: =>
    for fileView in @fileViews
      fileView.readFileNameAndContent()

    description = @$("#gist-editor-description").val()
    files = @options.gistFiles.toGitHubFormat()

    window.a = gist = new SeminarProto.Models.Gist(
      description: description
      files: files
    )

    gist.url = "/create_gist"
    gist.save({},
      success: @onSyncFinish
      error: (gist, response)->
        alert("sync error")
    )

  onSyncFinish: (gist, response)->
    id = response.id
    description = response.description
    $("#answer_gist_id").val(id)
    $("#answer_title").val(description)
    $("#answer_description").val(description)

  render: ->
    @$el.html(@template())
    @addFile()

    return this
