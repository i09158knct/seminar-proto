SeminarProto = SeminarProto || {};
;(function _util() {
  var
    regexFindId = /^user_id=(.*)/,
    name,
    id;

  SeminarProto.buildLink = function(text, href, classNames) {
    var
      link = document.createElement("a");
    link.textContent = text;
    link.href = href;
    link.className = classNames;
    return link;
  };

  SeminarProto.getCurrentUserName = function() {
    name = name || jQuery("#current-user-name").text();
    return name;
  };
  SeminarProto.getCurrentUserId = function() {
    var
      cookies = document.cookie.split("; "),
      result,
      i;

    for (i = cookies.length; i--;) {
      result = cookies[i].match(regexFindId);
      if (result) {
        return +result[1];
      }
    }

    throw new Error("User ID Not Found");
  };
}).call(this);