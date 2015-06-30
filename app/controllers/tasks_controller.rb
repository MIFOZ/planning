class TasksController < ApplicationController
  before_action :set_plan
  before_action :set_task, :only => [:update, :destroy]

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
      
    @task.time_consuming = 8
    @task.continuance = 2
    @task.exec = HumanBean.take
    @task.planned_begin = Time.now
    @task.planned_end = Time.now
    @task.state = 0
    @task.completeness = 0
    @task.save

    respond_to do |format|
      format.html {redirect_to edit_plan_path(@plan)}
      format.js
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(allowed_params)
      respond_to do |format|
        format.html
        format.js
      end
    else
      # renderer 'new'
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
    params.require(:task).permit(:title, :exec_id, :completeness, :time_consuming, :continuance, :planned_begin, :planned_end)
  end

end
