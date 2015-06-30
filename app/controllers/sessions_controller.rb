class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to current_tasks_path, :notice => 'Авторизирован'
    else
      flash.now.alert = 'Неверный email или пароль'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => 'Вышел!'
  end
end
