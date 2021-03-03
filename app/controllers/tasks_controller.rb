class TasksController < ApplicationController
  
  #before_action
  #task操作上はログインしていないと操作できないように設定
  #@taskに代入も実施
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :destroy, :update, :edit]
  
  def index
    @tasks = current_user.tasks.page(params[:page]).per(10)
  end
  
  def new
    @task = current_user.tasks.build
  end
  
  # before_action ON
  def show
  end

  def create
    
    @task = current_user.tasks.build(task_params)
    
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

  # strong parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  # 操作対象が自身の持ち物であるか確認
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])

    unless @task
      redirect_to root_url
    end
    
  end

end
