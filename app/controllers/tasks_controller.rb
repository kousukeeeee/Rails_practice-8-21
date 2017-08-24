class TasksController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destory]
  
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクが正常に追加されました。'
      redirect_to @task
    else
      flash.now[:denger] = 'タスクが追加されませんでした。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に更新されました。'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'タスクは正常に削除されました。'
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
  def set_params
    @task = Task.find(params[:id])
  end
end
