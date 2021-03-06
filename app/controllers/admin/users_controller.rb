class Admin::UsersController < Admin::BaseController
    #  the order of before_action matters here
    before_action :login_check, except: [:new]
    before_action :find_user, only:[:edit,:show, :update, :destroy]
    before_action :same_user_check, only: [:edit,:update, :destroy]
    before_action :admin_check

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
        redirect_to admin_users_path, notice: "更新帳戶成功"
      else
        @error_message = @user.errors.full_messages.to_sentence
        render :edit
      end
    end
  
    def destroy
      admin_count = User.where(admin: true).count
      
      if admin_count <= 1 && @user.admin
        redirect_to admin_users_path, notice: "無法刪除唯一管理者"        
      else
        if @user.destroy
          redirect_to admin_users_path, notice: "刪除帳戶成功"
        end
      end
      # debugger
    end
  
    private
    def find_user
      @user = User.find_by(id: params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :admin)
    end

    # def same_user_check
    #   if current_user != @user
    #     redirect_to users_path, notice: "你只能編輯或刪除自己的帳戶資訊"
    #   end
    # end
end