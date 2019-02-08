class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(user_name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      redirect_to login_path, notice: "Wrong username or password.Please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
  end

  def signup_index
  end

  def signup
    User.create(user_name: params[:name], password: params[:password], password_confirmation: params[:password])
    redirect_to login_path
  end

end
