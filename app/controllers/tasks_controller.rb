class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    @status = Task.statuses
    @priority = Task.priorities
    @q = Task.order(created_at: :desc).ransack(params[:q])
    @tasks = @q.result(distinct: true)

    @tasks = @tasks.order(created_at: :desc)
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
    current_user = User.first
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

  private 
  def task_params
    params.require(:task).permit(:title, :description, :end_time, :status, :priority)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end