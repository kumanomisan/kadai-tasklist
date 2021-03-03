class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #flash msg
    if @user.save
      flash[:success] = "アカウントの登録が成功しました"
      redirect_to tasks_url
    else
      flash.now[:danger] = "アカウントの登録に失敗しました"
      render :new
    end 
  end
  
  #strong_parameter
  def user_params
 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

   #p user_params
  end
  
end
