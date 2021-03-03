class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    
    @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    
    p"----------------------"
    p @tasks
    p"----------------------"
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #flash msg
    if @user.save
      flash[:success] = "アカウントの登録が成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "アカウントの登録に失敗しました"
      render :new
    end 
  end

  private
  
  #strong_parameter
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
