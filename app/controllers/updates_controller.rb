class UpdatesController < ApplicationController
  def show
    @update = Update.find(params[:id])
    @project = Project.find(@update.project_id)
    # @update.user = User.find(params[:user_id])
    # @update.user = current_user

  end

  def index
    @project = Project.find(params[:project_id])
    @updates = Update.where(project: @project)
  end

  def new
    @project = Project.find(params[:project_id])
    @update = Update.new
  end

  def edit
    @project = Project.find(params[:project_id])

    @update = Update.find(params[:id])
  end

  def create
    @update = Update.new(update_params)

    @project = Project.find(params[:project_id])
    @update.user = current_user
    @update.project = @project
    if @update.save
      redirect_to project_updates_path(@update.project)
    else

      @errors = @update.errors.full_messages
      render :new
    end
  end

  def update
    @update = Update.find(params[:id])

    if current_user.admin?
      @update.approval = true
      if @update.save
        redirect_to project_update_path(@update.project)
      end
    else
      if @update.approval
        if @update.update(update_params)
          redirect_to project_update_path(@update.project)
        else
          @errors = @update.errors.full_messages
          render :edit
        end
      end
    end
  end

  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    redirect_to action: "index"
  end

private

  def update_params
    params.require(:update).permit(:title, :description, :status, :approval)
  end

end
