class ProjectsController < ApplicationController
  def index
    if current_user.admin?
      @projects = current_user.projects
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
    @updates = @project.updates
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def delete
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :subject, :user_id)
    end
end
