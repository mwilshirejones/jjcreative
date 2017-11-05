require 'test_helper'

class MotionProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motion_project = projects(:motion_project)
  end

  test "should get index" do
    get motion_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_motion_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('MotionProject.count') do
      post motion_projects_url, params: { 
          motion_project: {
            title: 'A Motion Project'
          }
      }
    end
    assert_redirected_to motion_project_url(MotionProject.last)
  end

  test "should show project" do 
    get motion_project_url(@motion_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_motion_project_url(@motion_project)
    assert_response :success
  end

  test "should update project" do
    patch motion_project_url(@motion_project), params: { 
        motion_project: {
            title: 'New Title for Project'
        }
    }
    assert_redirected_to motion_project_url(@motion_project)
  end

  test "should destroy project" do
    assert_difference('MotionProject.count', -1) do
      delete motion_project_url(@motion_project)
    end
    assert_redirected_to motion_projects_url
  end
end
