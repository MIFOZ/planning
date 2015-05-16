class Project < ActiveRecord::Base
	belongs_to :manager, :class_name => 'HumanBean'
	belongs_to :exec, :class_name => 'HumanBean'
	belongs_to :workflow, :class_name => 'Workflow'

	def to_code
		code
	end
end
