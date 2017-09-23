class SmsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    puts "inside sms#create"
    @user = current_user
    @user.text_user(params[:tel], params[:message])

    redirect_to project_path(params[:project_id])
  end

  def send_all
    @users = Projects.users
    @users.each do |user|
      user.text_user(user.phone, params[:message])
    end
  end

end
