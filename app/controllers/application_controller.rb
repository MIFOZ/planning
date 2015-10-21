class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      @current_human_bean = @current_user.human_bean
    end

    @current_user
  end

  def get_overdue_tasks (tasks)
    p "tasks: #{tasks}"
    overdue_tasks = []
    tasks.each do |task|
      if !task.end_actual
        if Time.now > task.end_planned
          overdue_tasks.push(task)
        end
      elsif task.end_actual > task.end_planned
          overdue_tasks.push(task)
      end
    end

    return overdue_tasks
  end

end