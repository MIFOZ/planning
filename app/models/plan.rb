class Plan < ActiveRecord::Base
	belongs_to :created_by, :class_name => 'HumanBean'
end
