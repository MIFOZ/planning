class CurrentTasksController < ApplicationController

  def index

    current_user

    @start_time = @current_human_bean.tasks.minimum(:begin_planned)#.where.not(:completeness => 100)
    @end_time = Time.now


    @finished_tasks = @current_human_bean.tasks.where(:completeness => 100)

    @overdue_tasks = @current_human_bean.tasks.where.not(:completeness => 100).where('end_planned <= ?', Time.now)

    @current_tasks = @current_human_bean.tasks

    @total_labor_input_planned = @current_tasks.map(&:labor_input_planned).sum

    @current_tasks_uncompleted = @current_human_bean.tasks.where.not(:completeness => 100)

    @overdue_tasks = get_overdue_tasks(@current_tasks_uncompleted)

    @current_tasks_completed = @current_human_bean.tasks.where(:completeness => 100)

    @total_labor_input_actual = @current_tasks_completed.map(&:labor_input_actual).sum

  end

end
