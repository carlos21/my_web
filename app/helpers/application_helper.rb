module ApplicationHelper
  require "redcarpet"

  def markdown(text)
    #Redcarpet.new(text, :hard_wrap).to_html.html_safe
    rc = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true)
    rc.render(text).html_safe
  end

end
