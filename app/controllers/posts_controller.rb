class PostsController < ApplicationController
  before_action :find_the_project

  def index
    @posts = @project.posts
  end

  def show
    @post = @project.posts.find(params[:id])
  end

  def new
    @post = @project.posts.build
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.create(post_params)
    redirect_to project_path(@project)
  end

  def edit
    @post = @project.posts.find(params[:id])
  end

  def update
    @post = @project.posts.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@project, @post] }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = @project.posts.find(params[:id])
    @post.destroy
    redirect_to project_path(@project)
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_the_project
    @project = Project.find(params[:project_id])
  end
end
