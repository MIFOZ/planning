class TasksController < ApplicationController
  before_action :set_plan
  before_action :set_task, :only => [:update, :destroy, :finish_editing]

  def create
    @task = @plan.tasks.build
    @task.title = ''

    if @plan.tasks.present?
      min = @plan.tasks.order(:idx).min
      if (min)
        @task.idx = min.idx + 1
      else
        @task.idx = 0
      end
    else
      @task.idx = 0
    end
    
    current_user
    human_bean = @current_user.human_bean
    @task.labor_input_planned = 8
    @task.duration_planned = 2
    @task.exec = human_bean
    @task.begin_planned = human_bean.nearest_free_time
    p "begin_planned: #{@task.begin_planned}"
    @task.end_planned = @task.begin_planned + 8.hour
    @task.state = 0
    @task.completeness = 0
    @task.save

    respond_to do |format|
      format.html {redirect_to edit_plan_path(@plan)}
      format.js
    end
  end

  def edit
    # old = 
  end
  
  def update
    new_task = @task
    new_task.attributes = allowed_params

    



    if @task.update_attributes(allowed_params)
      respond_to do |format|
        format.html { render :nothing => true }
      end
    else
    end
  end

  def finish_editing
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @task.destroy
  end

  private
  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def allowed_params
    params.require(:task).permit(:title, :exec_id, :completeness, :labor_input_planned, :duration_planned, :begin_planned, :end_planned)
  end

end
