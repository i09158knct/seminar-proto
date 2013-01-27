SeminarProto.Views.Reviews ||= {}

class SeminarProto.Views.Reviews.ShowView extends Backbone.View
  template: JST["backbone/templates/reviews/show"]

  render: ->
    targets = @model.get("targets")
    regexReplaceDot = /\./g

    for fileName of targets
      for lineNumber of targets[fileName]
        selector =
          "#file-" +
          fileName.replace(regexReplaceDot, "-") +
          "-LC" +
          lineNumber
        $(selector).addClass("line-highlighted")


    @$el.html(@template(@model.toJSON()))
    return this
