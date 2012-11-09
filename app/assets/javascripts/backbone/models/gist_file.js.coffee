class SeminarProto.Models.GistFile extends Backbone.Model
  paramRoot: 'gist_file'

  defaults:
    fileName: null
    content: null

class SeminarProto.Collections.GistFilesCollection extends Backbone.Collection
  model: SeminarProto.Models.GistFile
  url: '/gist_files'

  toGitHubFormat: ->
    formatedFiles = {}
    for gistFile in @models
      file = gistFile.toJSON()
      formatedFiles[file.fileName] = { content: file.content }

    return formatedFiles
