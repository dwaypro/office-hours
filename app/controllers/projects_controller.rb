class ProjectsController < ApplicationController
  def index

    @subscription = Subscription.new

    if current_user.admin?
      @projects = current_user.projects
    else
      @projects = Project.all
    end
  end

  def show
      @project = Project.find(params[:id])
      redirect_to projects_path
   # @updates = @project.updates
  end

  def new
   if current_user.admin?
    @project = Project.new
   else
    redirect_to projects_path
   end
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

  def destroy
    if current_user.admin?
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
    else
      redirect_to projects_path
    end
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :subject, :user_id, :location)
    end
end
