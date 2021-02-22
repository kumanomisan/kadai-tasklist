class TasksController < ApplicationController
  
  #before_action
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @tasks = Task.all
  end
  
  # before_action ON
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスク登録が完了しました！"
      redirect_to @task
    else
      flash.now[:danger] = "タスク登録に失敗しました"
      render :new
    end
    
  end
  
  # before_action ON
  def edit
  end

  # before_action ON
  def update
    if @task.update(task_params)
      flash[:success] = "タスク編集が完了しました！"
      redirect_to @task
    else
      flash.now[:danger] = "タスク編集に失敗しました"
      render :edit
    end 
  end
  
  # before_action ON
  def destroy
    @task.destroy
    
    flash[:success] = "タスクを削除しました"
    #redirectでprefixの時は _url
    redirect_to tasks_url
  end
  
  private
  
  # Method of before_action
  def set_task
    @task = Task.find(params[:id])
  end   
  
  # strong parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end

end
