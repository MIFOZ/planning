class Workflow < ActiveRecord::Base
	belongs_to :manager, :class_name => 'HumanBean'
	belongs_to :exec, :class_name => 'HumanBean'

	def to_short_title
		short_title
	end
end
