class HumanBeansController < ApplicationController
  before_action :set_human_bean, except: [:index, :new, :create]
  before_action :set_filtered_branches, only: [:new, :edit]

  def index
    @human_beans = HumanBean.all;
  end

  def new
    @human_bean = HumanBean.new
  end

  def edit
  end

  def create
    @human_bean = HumanBean.new(allowed_params)

    if @human_bean.save
      redirect_to human_beans_path
    else
      renderer 'new'
    end
  end

  def update
    if @human_bean.update_attributes(allowed_params)
      redirect_to human_beans_path
    else
      renderer 'new'
    end
  end

  private
  def set_human_bean
    @human_bean = HumanBean.find(params[:id])
  end

  def set_filtered_branches
    @filtered_branches = StructureUnit.where(:structure_type => 1)
  end

  def allowed_params
    params.require(:human_bean).permit(:last_name, :first_name, :patronymic, :branch_id, :post_id, :is_head)
  end

end
