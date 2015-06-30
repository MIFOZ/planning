class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    p params[:user]
    @user = User.new(allowed_params)
    p 'After New'
    if @user.save
      redirect_to current_tasks_path, :notice => 'Авторизирован!'
    else
      render 'new'
    end
  end

  private
  def allowed_params
    params.require(:user).permit(:email, :human_bean_id, :password, :password_confirmation)
  end

end
