class PlansController < ApplicationController
	before_action :set_plan, except: [:index, :new, :create]
	before_action :set_plan_id, only: [:show, :edit]

	def index
		@plans = Plan.all
		p 'eewqfqfw'
	end

	def new
		@plan = Plan.new
	end

	def edit
		@tasks = @plan.tasks
		#@task = Task.new
	end

	def create
		@plan = Plan.new(allowed_params)

		@plan.created_at = Time.now
		@plan.creation_date = Time.now
		@plan.created_by = HumanBean.find_by :last_name => 'Ефимов'

		if @plan.save
			redirect_to plans_path
		else
			renderer 'new'
		end
	end

	def update
		if @plan.update_attributes(allowed_params)
			redirect_to plans_path
		else
			renderer 'new'
		end
	end

	def update_task
		respond_to do |format|
			format.js
			format.html
			format.json
		end
		
		if params['edit-mode'] == 0

		end
	end

	private
	def set_plan
		@plan = Plan.find(params[:id])
	end

	def set_plan_id
		gon.plan_id = @plan.id
	end

	def allowed_params
		params.require(:plan).permit(:work_type, :workflow_id, :project_id, :title, :comment)
	end

end
