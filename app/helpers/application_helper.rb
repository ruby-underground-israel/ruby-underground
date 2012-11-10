module ApplicationHelper
  def markdown(text)
    options = { autolink: true, space_after_headers: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text).html_safe
  end
end
