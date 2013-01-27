SeminarProto.Views.Reviews ||= {}

class SeminarProto.Views.Reviews.NewView extends Backbone.View
  template: JST["backbone/templates/reviews/new"]

  events:
    "change #body": "changeBody"
    "submit #new-review": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

    $(".gist-file").on("click.NewView", ".line", (event) =>
      line = event.currentTarget
      @toggleTarget(line)
    )

  toggleTarget: (line) ->
    $line = $(line)
    $line.toggleClass("line-highlighted")

    fileName = @getFileName(line)
    lineNumber = @getLineNumber(line)
    lineContent = @getLineContent(line)

    targets = @model.get("targets")
    unless targets[fileName]?
      targets[fileName] = {}
    targetLines = targets[fileName]

    if targetLines[lineNumber]?
      delete targetLines[lineNumber]
    else
      targetLines[lineNumber] = lineContent

    @model.set("targets", targets)


  getLineContent: (line) ->
    line.textContent

  getLineNumber: (line) ->
    /\d+$/.exec(line.id)[0]

  getFileName: (line) ->
    $line = $(line)
    $gistFile = $line.parents(".gist-file")
    $fileMeta = $gistFile.find(".gist-meta")
    $fileMeta.children().eq(1).text()

  changeBody: (event) ->
    body = @$("#body").val()
    @model.set("body", body)

  save: (event) ->
    event.preventDefault()
    event.stopPropagation()

    @setMetaData()
    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (review) =>
        @model = review
        window.location.hash = "/#{@model.id}"

      error: (review, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  setMetaData: ->
    pathName = window.location.pathname
    answerId = /\/challenges\/\d+\/answers\/(\d+)/.exec(pathName)[1]

    url = $(".gist-meta").children()[0].href
    array = url.split("/")
    gistId = +array[4]
    gistCommitId = array[5]

    userId = SeminarProto.getCurrentUserId()

    @model.set(
      answer_id: answerId
      gist_id: gistId
      gist_commit_id: gistCommitId
      user_id: userId
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
