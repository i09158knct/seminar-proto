class SeminarProto.Models.Gist extends Backbone.Model
  paramRoot: 'gist'

  defaults:
    id: null
    description: null
    files: null

class SeminarProto.Collections.GistsCollection extends Backbone.Collection
  model: SeminarProto.Models.Gist
  url: '/gists'
