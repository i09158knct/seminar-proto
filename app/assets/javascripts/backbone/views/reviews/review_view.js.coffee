SeminarProto.Views.Reviews ||= {}

class SeminarProto.Views.Reviews.ReviewView extends Backbone.View
  template: JST["backbone/templates/reviews/review"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    jsonModel = @model.toJSON()
    if jsonModel.body?.length > 17
      jsonModel.body = jsonModel.body.substring(0, 17) + "..."
    @$el.html(@template(jsonModel))
    return this
