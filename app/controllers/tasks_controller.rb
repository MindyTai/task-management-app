class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]
  before_action :authorize

  def index
    @tasks = Task.includes(:user).where(user_id: session[:user_id])
    @status = Task.statuses
    @priority = Task.priorities
    
    @tasks = @tasks.order(end_time: params[:date]) if params[:date]
    @tasks = @tasks.order(priority: params[:priorities]) if params[:priorities]
    @tasks = @tasks.order(created_at: :desc)
    @tasks = @tasks.order(:created_at).page(params[:page]).per(10)

    @tasks = @tasks.where("title LIKE?", "%#{params[:search]}%") if params[:search]
    @tasks = @tasks.where(status: params[:status]) if params[:status]
    @tasks = @tasks.where(priority: params[:priority]) if params[:priority]
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    current_user = User.find_by_id(session[:user_id])
    @task = current_user.tasks.new(task_params)
    
    if @task.save
      redirect_to tasks_path
      flash[:success] = t('.success', resource: Task.model_name.human.capitalize)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
      flash[:success] = t('.update')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy if @task
    redirect_to tasks_path
    flash[:danger] = t('.delete')
  end

  def show
    @tasks = Task.includes(:user).where(user_id: session[:user_id])
    @tasks = @tasks.tagged_with(params[:tag_ids]) if params[:tag_ids].present?
  end

  private 
  def task_params
    params.require(:task).permit(:title, :description, :end_time, :status, :priority, tag_ids: [])
  end

  def find_task
    current_user = User.find_by_id(session[:user_id])
    @task = current_user.tasks.find_by(id: params[:id])
  end

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_path, notice: "Please log in"
    end
  end
  
end