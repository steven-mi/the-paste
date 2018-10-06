require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @post = posts(:one)
  end

  test "should get index" do
    get project_posts_path(@project)
  end

  test "should get show" do
    get project_post_path(@project, @post)
    assert_response :success
    assert_template "posts/show"
  end

  test "should get new" do
    get new_project_post_path(@project)
    assert_response :success
    assert_template "posts/new"
  end

  test "should get create" do
    assert_difference "Post.count", 1 do
      post project_posts_path(@project), params: {post: {title: "testtest", body: "test", syntax: "html"}}
    end
  end

  test "should get new timestamp when create" do
    post project_posts_path(@project), params: {post: {title: "testtest", body: "test", syntax: "html"}}
    update_time = @project.updated_at.strftime("%Y-%m-%d %H:%M")
    current_time = DateTime.now.in_time_zone('UTC').strftime("%Y-%m-%d %H:%M")
    assert_equal current_time, update_time
  end

  test "should get edit and update timestamp" do
    get edit_project_post_path(@project, @post)
    assert_response :found

    update_time = @project.updated_at.strftime("%Y-%m-%d %H:%M")
    current_time = DateTime.now.in_time_zone('UTC').strftime("%Y-%m-%d %H:%M")
    assert_equal current_time, update_time
  end

  test "should get update" do
    patch project_post_path(@project, @post), params: {post: {title: "test", body: "testtest", syntax: "html"}}
    assert_response :found
  end

  test "should not destroy" do
    assert_difference "Post.count", 0  do
      delete project_post_path(@project, @post)
      assert_response :found
    end
    update_time = @project.updated_at.strftime("%Y-%m-%d %H:%M")
    current_time = DateTime.now.in_time_zone('UTC').strftime("%Y-%m-%d %H:%M")
    assert_equal current_time, update_time
  end

end
