class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]

  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(allowed_params)

    if @project.save
      redirect_to projects_path
    else
      renderer 'new'
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def allowed_params
      params.require(:project).permit(:code, :title, :manager_id, :exec_id, :openning_order_number, :openning_order_date, :workflow_id)
    end

end
