class HumanBean < ActiveRecord::Base
  belongs_to :post
  belongs_to :branch, :class_name => 'StructureUnit'
  has_many :tasks, :foreign_key => :exec_id

  enum is_head: { Да: true, Нет: false }

  def to_name_w_initials
    "#{last_name} #{first_name[0]}. #{patronymic[0]}."
  end

  def nearest_free_time
    last_task = tasks.where.not(:completeness => 100).where('end_planned > ?', Time.now).order(:end_planned => :desc).take

    p "last_task: #{ last_task}"

    if last_task
      next_business_hour(last_task.end_planned).beginning_of_hour
    else
      Time.now
    end
  end

  def occupancy
    pending_tasks = tasks.where.not(:completeness => 100).where('end_planned > ?', Time.now).where('begin_actual != ?', nil)
    pending_tasks.count
  end

  def next_business_hour (date)
    next_date = business_day_in(date, 1)
  end
end