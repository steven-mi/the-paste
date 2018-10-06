require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_path
    assert_response :success
  end

  test "should get show" do
    get project_path(@project)
    assert_response :success
  end

  test "should get new" do
    get new_project_path(@project)
    assert_response :found
  end

  test "should get edit" do
    get edit_project_path(@project)
    assert_response :found
  end

  test "should not create" do
    assert_difference "Project.count", 0 do
      post projects_path, params: {project: {title: "testtest", body: "test"}}
    end
  end

  test "should not update" do
    patch project_path(@project), params: {title: "test", password: "0000"}
    assert_equal @project.title = 'Prometheus'
    assert_response :found
  end

#  test "should not delete" do
 #   assert_difference "Project.count", 0 do
  #    delete project_path(@project)
  #  end
 # end


end
