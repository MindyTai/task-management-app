class AdminController < ApplicationController

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
      redirect_to admin_index_path
      flash[:success] = 'User has Successfully Added'
    else
      render :new
    end 

  end

  def destroy
    if User.where(:admin => true).size > 1
      @user = User.find(params[:id])
      @user.destroy if @user
      redirect_to admin_index_path
      flash[:danger] = 'Admin has been deleted'
    else
      redirect_to adminshow_path
      flash[:danger] = 'Cannot delete the last admin'
    end
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if params[:flag]
      @user = @user.update(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:password], admin: params[:flag])
      redirect_to admin_index_path
      flash[:success] = 'Successfully Updated'
    else 
      @user = @user.update(user_name: params[:user][:user_name], password: params[:user][:password], password_confirmation: params[:password], admin: false)
      redirect_to admin_index_path
      flash[:success] = 'Successfully Updated'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def admin_show
    @users = User.where(admin: true)
  end

  private 
  def user_params
    params.permit(:password, :user_name, :admin)
  end

  def task_params
    params.permit(:title, :description, :end_time, :status, :priority)
  end

end
