class Plan < ActiveRecord::Base
	belongs_to :workflow, :class_name => 'Workflow'
	belongs_to :order, :class_name => 'Project'
	belongs_to :project, :class_name => 'Project'
	belongs_to :created_by, :class_name => 'HumanBean'
	has_many :tasks, :dependent => :destroy

	enum work_type: { По_заказу: 0, По_проекту: 1, По_процессу: 2, По_протоколу_совещаний: 3, Произвольный: 4 }
	enum state: { Подготовлен: 0 }
end
