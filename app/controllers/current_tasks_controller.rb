class CurrentTasksController < ApplicationController

  def index
    current_user
    @current_tasks = @current_human_bean.tasks
  end

end
