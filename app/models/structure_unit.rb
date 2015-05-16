class StructureUnit < ActiveRecord::Base
	belongs_to :head, :class_name => 'HumanBean'
	belongs_to :parent, :class_name => 'StructureUnit'
	has_many :children

	enum structure_type: { Департамент: 0, Отдел: 1 }

end
