class TasksController < ApplicationController
	before_action :set_plan

	def create
		@task = @plan.tasks.new
		@task.title = ''
		@task.plan = Plan.take
		@sorted = @plan.tasks.sort_by {|p| p.idx || 0}
		if @sorted
			#logger.debugger '#{@sorted.inspect}'
			@task.idx = 3#@sorted.first.idx + 1
		end
		# @task.idx = @plan.tasks.sort.first.idx.try.to_i + 1
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
			format.js {}
			format.json {render json: @task}
		end
	end

	def enter_change_state
		
	end

	private
	def set_plan
		@plan = Plan.find(params[:plan_id])
	end

end
