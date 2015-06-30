class Task < ActiveRecord::Base
	belongs_to :plan, :class_name => 'Plan'	
	belongs_to :parent_task, :class_name => 'Task'
	belongs_to :exec, :class_name => 'HumanBean'

	enum state: ['подг-на', 'на согл-нии', 'ост-на', 'вып-тся', 'вып-на']

	def get_number_str
    if (parent_task)
      parent_task.get_number_str.to_s + ".#{idx + 1}"
    else
      idx + 1
    end
	end
end
