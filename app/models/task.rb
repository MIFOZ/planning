class Task < ActiveRecord::Base
	belongs_to :plan, :class_name => 'Plan'	
	belongs_to :parent, :class_name => 'Task'
	belongs_to :exec, :class_name => 'HumanBean'

	enum state: ['Подготовлен']

	# def <=>(other)
	# 	self.idx <=> other.idx
	# end
end
