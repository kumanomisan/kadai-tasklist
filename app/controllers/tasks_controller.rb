class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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

  def edit
    
    @task = Task.find(params[:id])
    
  end

  def update
    
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "タスク編集が完了しました！"
      redirect_to @task
    else
      flash.now[:danger] = "タスク編集に失敗しました"
      render :edit
    end 
      
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクを削除しました"
    #redirectでprefixの時は _url
    redirect_to tasks_url
  end
  
  private
  
  # strong parameter
  def task_params
    params.require(:task).permit(:content)
  end
  
end
