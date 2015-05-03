class StructureUnitsController < ApplicationController
	before_action :set_structure_unit, except: [:index, :new, :create]

	def index
		@structure_units = StructureUnit.all
	end

	def new
		@structure_unit = StructureUnit.new
		@structure_unit.head = HumanBean.take
	end

	def create
		@structure_unit = StructureUnit.new(allowed_params)
		#@structure_unit.type = @structure_unit.structure_type

		if @structure_unit.save
			redirect_to structure_units_path
		else
			renderer 'new'
		end
	end

	def update
		if @structure_unit.update_attributes(allowed_params)
			#@structure_unit.type = @structure_unit.structure_type
			redirect_to structure_units_path
		else
			renderer 'new'
		end
	end

	def edit
	end

	def show
	end

	private
	def set_structure_unit
		@structure_unit = StructureUnit.find(params[:id])
	end

	def allowed_params
      params.require(:structure_unit).permit(:name, :structure_type, :code, :head_id, :parent_id)
    end
end
