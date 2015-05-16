class WorkflowsController < ApplicationController
	before_action :set_workflow, except: [:index, :new, :create]	

	def index
		@workflows = Workflow.all
	end

	def new
		@workflow = Workflow.new
	end

	def edit
	end

	def create
		@workflow = Workflow.new(allowed_params)

		if @workflow.save
			redirect_to workflows_path
		else
			renderer 'new'
		end
	end

	private
	def set_workflow
		@workflow = Workflow.find(params[:id])
	end

	def allowed_params
		params.require(:workflow).permit(:idx, :title, :short_title, :manager_id, :exec_id)
	end

end
