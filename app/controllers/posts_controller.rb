class PostsController < ApplicationController
  before_action :find_the_project

  def index
    @posts = @project.posts
  end

  def show
    @post = @project.posts.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = PostPdf.new(@post)

        send_data pdf.render, filename: "post_@{@post.id}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  def new  
    @available_languages = [["html", "html"], 
    ["python", "python hljs"],
    ["bash", "hljs-meta"], 
    ["cpp", "cpp hljs"], 
    ["scala", "scala hljs"], 
    ["java", "java hljs"], 
    ["json", "json hljs"],
    ["ruby", "ruby hljs"],
    ]
    @post = @project.posts.build
  end

  def create
    @project = Project.find(params[:project_id])
    update_timestamp
    @post = @project.posts.create(post_params)
   
    redirect_to controller: "projects", action: "show", id: @project, password: @project.password
  end

  def edit
    @available_languages = [["html", "html"], 
    ["python", "python hljs"],
    ["bash", "hljs-meta"], 
    ["cpp", "cpp hljs"], 
    ["scala", "scala hljs"], 
    ["java", "java hljs"], 
    ["json", "json hljs"],
    ["ruby", "ruby hljs"],
    ]
    @post = @project.posts.find(params[:id])
  end

  def update
    @post = @project.posts.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to [@project, @post]}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    update_timestamp
    @post = @project.posts.find(params[:id])
    @post.destroy
    redirect_to project_path(@project)
  end

  private

  def update_timestamp
    Project.find(params[:project_id]).touch

  end

  def post_params
    params.require(:post).permit(:title, :body, :syntax)
  end

  def find_the_project
    @project = Project.find(params[:project_id])
  end
end
