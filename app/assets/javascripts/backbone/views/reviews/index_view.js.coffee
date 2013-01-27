SeminarProto.Views.Reviews ||= {}

class SeminarProto.Views.Reviews.IndexView extends Backbone.View
  template: JST["backbone/templates/reviews/index"]

  initialize: () ->
    @options.reviews.bind('reset', @addAll)

  addAll: () =>
    @options.reviews.each(@addOne)

  addOne: (review) =>
    view = new SeminarProto.Views.Reviews.ReviewView({model : review})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(reviews: @options.reviews.toJSON() ))
    @addAll()

    return this
