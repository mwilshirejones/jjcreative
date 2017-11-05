require 'test_helper'

class StillsProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stills_project = projects(:stills_project)
  end

  test "should get index" do
    get stills_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_stills_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('StillsProject.count') do
      post stills_projects_url, params: { 
          stills_project: {
            title: 'A Stills Project'
          }
      }
    end
    assert_redirected_to stills_project_url(StillsProject.last)
  end

  test "should show project" do 
    get stills_project_url(@stills_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_stills_project_url(@stills_project)
    assert_response :success
  end

  test "should update project" do
    patch stills_project_url(@stills_project), params: { 
        stills_project: {
            title: 'New Title for Project'
        }
    }
    assert_redirected_to stills_project_url(@stills_project)
  end

  test "should destroy project" do
    assert_difference('StillsProject.count', -1) do
      delete stills_project_url(@stills_project)
    end
    assert_redirected_to stills_projects_url
  end
end
