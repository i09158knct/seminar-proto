jQuery ($) ->
  $("table").on "click", "td", (event) ->
    link = event.toElement.getElementsByTagName("a")[0]
    link?.dispatchEvent(new Event("click"))
