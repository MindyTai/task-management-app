class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @user = User.first
    @task = @user.tasks.new(task_params)
    
    if @task.save
      redirect_to tasks_path
      flash[:notice] = '新增任務成功！'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path 
      flash[:success] = '資料更新成功!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy if @task
    redirect_to tasks_path
    flash[:danger] = '任務已刪除！'
  end

  private 
  def task_params
    params.require(:task).permit(:title, :description, :end_time, :status)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end
