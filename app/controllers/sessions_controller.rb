class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(user_name: params[:name])
    # user = User.find_by(admin: true)
    if user && user.admin && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_users_path
    elsif user && (user.admin == false) && user.authenticate(params[:password])
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
    if params[:flag]
      User.create(user_name: params[:name], password: params[:password], password_confirmation: params[:password], admin: params[:flag])
    else
      User.create(user_name: params[:name], password: params[:password], password_confirmation: params[:password], admin: false)
    end
    
    redirect_to login_path, notice: "Successfully signed up"
  end

end
