class ProjectsController < ApplicationController
  def index
<<<<<<< HEAD
    if params[:filter]
      
      @projects = Project.where('title LIKE ?', "%#{params[:filter]}%").order('updated_at DESC')
      if @projects.length==0
        flash[:dark] = "No project found"
        redirect_to root_path
      end
    else
      @projects = Project.order('updated_at DESC')
    end
=======
    @projects = Project.includes(:posts).order('posts.created_at DESC')
>>>>>>> 08d41c328568f9e01c1523e3bb8f1f2c6cae1ee8
  end

  def show

    @project = Project.find(params[:id])

    if request.GET[:password] != @project.password
      flash[:dark] = "Wrong password. Try it again."
      redirect_to root_path
    end

  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    if project_params[:password] == ""
      @project = Project.new({title: project_params[:title], password: nil})
    else
      @project = Project.new(project_params)
    end
    if @project.save
      redirect_to controller: "projects", action: "show", id: @project, password: @project.password
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if project_params[:password] == ""

      @project.update({title: project_params[:title], password: nil})

    else
      @project.update(project_params)

    end

    if @project.save
      redirect_to controller: "projects", action: "show", id: @project, password: @project.password
    else
      render 'new'
    end

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path()
  end

  private

  def project_params

    params.require(:project).permit(:title, :password)

  end

end
