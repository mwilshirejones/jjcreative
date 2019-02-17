require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  # All the projects controller is used for is listing all projects,
  # adding stills/motion porjects is delegated to their controllers
  test "should get index" do
    get projects_url
    assert_response :success
  end
end
