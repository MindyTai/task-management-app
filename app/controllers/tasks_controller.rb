class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    if params[:date] 
      @tasks = Task.order(end_time: params[:date])
    else 
      @tasks = Task.order(created_at: :desc)
    end
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
    params.require(:task).permit(:title, :description, :end_time, :status)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end