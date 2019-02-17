class ProjectFrontEndCell < Cell::ViewModel
  property :title
  property :description

  def show
    render
  end

  def render_description_markdown
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML
    ).render(description)
  end
end
