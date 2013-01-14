module ApplicationHelper
  def store_current_url
    session[:return_to] = request.fullpath
  end

  def markdown(text)
    $markdown.render(text).html_safe
  end
end
