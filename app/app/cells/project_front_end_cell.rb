class ProjectFrontEndCell < Cell::ViewModel
  property :title
  property :description
  property :short_description

  def show
    render
  end
end
