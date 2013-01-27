SeminarProto.Views.Reviews ||= {}

class SeminarProto.Views.Reviews.EditView extends Backbone.View
  template: JST["backbone/templates/reviews/edit"]

  events:
    "submit #edit-review": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (review) =>
        @model = review
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
