class SubscriptionsController < ApplicationController

  def create
    @user = current_user
    @project = Project.find(params[:subscription][:project_id])
    
    @subscription = Subscription.new(user: @user, project: @project)
    if @subscription.save
      redirect_to projects_path##project SHOW page
    else
      @project = Project.find(params[:project_id])
      redirect_to projects ##project INDEX page
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])

    if subscription.user == current_user
      subscription.destroy
      redirect_to projects_path ##project SHOW page
    else
      redirect_to projects_path ##project INDEX page
    end
  end
end
