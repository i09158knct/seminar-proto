renderer = Redcarpet::Render::HTML.new(
  :filter_html => true,
  :no_images => true,
  :no_styles => true
)

$markdown = Redcarpet::Markdown.new(renderer,
  :tables => true,
  :no_intra_emphasis => true,
  :fenced_code_blocks => true,
  :autolink => true,
  :strikethrough => true,
  :lax_spacing => true,
  :superscript => true
)
