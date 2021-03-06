class UsersController < ApplicationController
  before_action :login_check, except: [:new, :create]
  before_action :find_user, only:[:edit,:show, :update, :destroy]
  before_action :same_user_check, only: [:edit,:update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "#{@user.username} 已註冊成功！"
    else
      @error_message = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to user_tasks_path(current_user), notice: "更新帳戶成功"
    else
      @error_message = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to user_tasks_path(current_user), notice: "刪除帳戶成功"
    end
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
