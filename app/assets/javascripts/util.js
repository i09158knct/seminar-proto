SeminarProto = SeminarProto || {};
;(function _util() {
  SeminarProto.buildLink = function(text, href, classNames) {
    var
      link = document.createElement("a");
    link.textContent = text;
    link.href = href;
    link.className = classNames;
    return link;
  };

  SeminarProto.getCurrentUserName = function() {
    return jQuery("#current-user-name").text();
  };
}).call(this);