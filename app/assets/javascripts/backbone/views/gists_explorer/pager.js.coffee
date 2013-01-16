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
    page = @$el.find("#gists-page").val()
    e.target.textContent = "loading..."

    if localStorage
      gists = localStorage.getItem("gists " + userName + page)
      if gists
        @options.gists.reset JSON.parse(gists)

    gh3user = new Gh3.User(userName)
    gh3gists = new Gh3.Gists(gh3user)

    gh3gists.fetch {page: page}, null, (err, res) =>
      if err
        alert("Error")
        return

      gists = res.gists
      @options.gists.reset gists
      e.target.textContent = "Fetch"
      if localStorage
        localStorage.setItem("gists " + userName + page, JSON.stringify(gists))


  render: ->
    userName = $("#current-user-name").text()
    @$el.html(@template({userName: userName}))
    return this
