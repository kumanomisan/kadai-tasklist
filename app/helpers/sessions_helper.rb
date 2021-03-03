module SessionsHelper
  
  def current_user
    #a ||= xxx　・・・ a が false か nil なら a に xxx を代入する
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #trueが返ってこればlogged_in?もtrueとする
  def logged_in?
    !!current_user
  end
  
end
