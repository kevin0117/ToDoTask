# class SessionsController < ApplicationController  
class Admin::SessionsController < Admin::BaseController
  before_action :find_session_user, only: [:create, :delete]
  def new
  end

  def create    
    @user = User.find_by(email: params[:session][:email].downcase)

      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:notice] = "成功登入"
        redirect_to user_tasks_path(@user)
      else
        if (params[:session][:email] == "")
          redirect_to login_path, notice: "Email 不可空白"
   
        elsif (params[:session][:password] == "")
          redirect_to login_path, notice: "密碼 不可空白"
        else
          redirect_to login_path, notice: "使用者資料輸入錯誤"
        end
      end
      # debugger
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "已登出"
  end
  private
  def find_session_user
    @user = User.find_by(email: params[:session][:email].downcase)
  end
end
