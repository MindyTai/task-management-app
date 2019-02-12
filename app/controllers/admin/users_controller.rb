class Admin::UsersController < ApplicationController
  def index
    @users = User.where(admin: false)
  end

  def create
    if params[:flag]
      @user = User.new(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:user][:password], admin: params[:flag])
    else
      @user = User.new(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:user][:password], admin: false)
    end

    if @user.save
      redirect_to admin_users_path
      flash[:success] = 'User has Successfully Added'
    else
      render :new
    end

  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if params[:flag]
      @user = @user.update(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:password], admin: params[:flag])
      redirect_to admin_users_path
      flash[:success] = 'Successfully Updated'
    else 
      @user = @user.update(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:password], admin: false)
      redirect_to admin_users_path
      flash[:success] = 'Successfully Updated'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if @user
    redirect_to admin_users_path
    flash[:danger] = 'User has been deleted.'
  end

end
