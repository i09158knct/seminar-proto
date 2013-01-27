class SeminarProto.Models.Review extends Backbone.Model
  paramRoot: 'review'

  defaults:
    answer_id: null
    body: null
    gist_commit_id: null
    gist_id: null
    targets: {}
    user_id: null

class SeminarProto.Collections.ReviewsCollection extends Backbone.Collection
  model: SeminarProto.Models.Review

  initialize: (options) ->
    challengeId = options.challengeId
    answerId = options.answerId

    @url =
      "/challenges/" +
      challengeId +
      "/answers/" +
      answerId +
      "/reviews"
