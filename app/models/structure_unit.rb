class StructureUnit < ActiveRecord::Base
	belongs_to :head, :class_name => 'HumanBean'
	belongs_to :parent, :class_name => 'StructureUnit'
	has_many :children

	enum type2: { department: 0, branch: 1 }

end
