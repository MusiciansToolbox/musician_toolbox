class SessionsController < ApplicationController

  before_action :authenticate_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
