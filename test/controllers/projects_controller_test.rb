require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_path
    assert_response :success
    assert_template "projects/index"
  end

  test "should get show" do
    get project_path(@project)
    assert_response :success
    assert_template "projects/show"
  end

  test "should get new" do
    get new_project_path
    assert_response :success
    assert_template "projects/new"
  end

  test "should get edit" do
    get edit_project_path(@project)
    assert_response :success
    assert_template "projects/edit"
  end

  test "posting" do
    assert_difference "Project.count", 1 do
      post "/projects", params: { project: { title: "can create"} }
    end
  end

  test "destroy" do
    assert_difference "Project.count", -1 do
      delete project_path(@project)
    end
  end
end
