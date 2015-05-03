class PlansController < ApplicationController
	before_action :set_plan, except: [:index, :new, :create]

	def index
		@plans = Plan.all
	end

	def new
		@plan = Plan.new
	end

	def edit
		@posts = Post.all
	end

	def create
		@plan = Plan.new(allowed_params)

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
		params.require(:plan).permit(:work_type, :workflow, :workflow_section, :work_id, :name, :created_by, :created_at)
	end

end
