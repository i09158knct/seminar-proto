class SeminarProto.Routers.ReviewsRouter extends Backbone.Router
  initialize: (options) ->
    pathName = window.location.pathname
    result = /\/challenges\/(\d+)\/answers\/(\d+)/.exec(pathName)
    challengeId = result[1]
    answerId = result[2]
    @reviews = new SeminarProto.Collections.ReviewsCollection(
      challengeId: challengeId
      answerId: answerId
    )
    @reviews.reset options.reviews

  routes:
    "new"      : "newReview"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newReview: ->
    @prepareChangeView()
    @view = new SeminarProto.Views.Reviews.NewView(collection: @reviews)
    $("#reviews").html(@view.render().el)

  index: ->
    @prepareChangeView()
    @view = new SeminarProto.Views.Reviews.IndexView(reviews: @reviews)
    $("#reviews").html(@view.render().el)

  show: (id) ->
    @prepareChangeView()
    review = @reviews.get(id)

    @view = new SeminarProto.Views.Reviews.ShowView(model: review)
    $("#reviews").html(@view.render().el)

  edit: (id) ->
    @prepareChangeView()
    review = @reviews.get(id)

    @view = new SeminarProto.Views.Reviews.EditView(model: review)
    $("#reviews").html(@view.render().el)

  prepareChangeView: ->
    @removeHighlight()
    @removeEventhandlers()

  removeHighlight: ->
    className = "line-highlighted"
    $(".gist").find("." + className).removeClass(className)

  removeEventhandlers: ->
    $(".gist-file").off("click.NewView", ".line")
