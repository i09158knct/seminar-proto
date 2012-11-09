SeminarProto.Views.GistsExplorer ||= {}

class SeminarProto.Views.GistsExplorer.PagerView extends Backbone.View
  template: JST["backbone/templates/gists_explorer/pager"]

  events:
    "click #gists-fetch": "fetch"

  el: "#gists-explorer-pager"

  initialize: ->

  fetch: (e) ->
    e.preventDefault()

    userName = @$("#gists-user-name").val()
    gh3user = new Gh3.User(userName)
    gh3gists = new Gh3.Gists(gh3user)

    page = @$el.find("#gists-page").val()
    gh3gists.fetch {page: page}, null, (err, res) =>
      if err
        alert("Error")
        return

      @options.gists.reset res.gists



  render: ->
    userName = $("#current-user-name").text()
    @$el.html(@template({userName: userName}))
    return this
