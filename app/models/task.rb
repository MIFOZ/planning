class Task < ActiveRecord::Base

  include ActiveModel::Dirty

  attr_accessor :planned_duration

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
 
  def get_planned_duration
    (end_planned - begin_planned).to_i
  end

  def get_actual_duration
    if (end_actual && begin_actual)
      (end_actual - begin_actual).to_i
    end
  end

end
