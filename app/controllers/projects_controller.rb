class ProjectsController < ApplicationController
  def index
    @projects = Project.order('updated_at DESC')
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
