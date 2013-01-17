jQuery ($) ->
  $("table").on "click", "td", (event) ->
    td = event.currentTarget
    link = td.getElementsByTagName("a")[0]
    link?.dispatchEvent(new Event("click"))
