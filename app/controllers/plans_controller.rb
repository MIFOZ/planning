class PlansController < ApplicationController
	before_action :set_plan, except: [:index, :new, :create]

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

	private
	def set_plan
		@plan = Plan.find(params[:id])
	end

	def allowed_params
		params.require(:plan).permit(:work_type, :workflow_id, :project_id, :title, :comment)
	end

end
