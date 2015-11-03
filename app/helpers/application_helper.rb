module ApplicationHelper

  def javascript(*files)
    p *files
    content_for(:head) { javascript_include_tag(*files) }
  end

  def business_days_between(date_from, date_to)
    business_days = 0
    date = date_to
    while date > date_from
      business_days = business_days + 1 unless date.saturday? or date.sunday?
      date = date - 1.day
    end
    business_days
  end

  def business_day_in(start_date, day_count)
    day_to_pass_count = 0
    day_count = 0

    # current_day = start_date
    # while day_counted < day_count
    #   current_day = current_day.tomorrow
    #   if (start_date.sunday)
    #     day_to_pass_count++
    #     day_count++
    #   else
    #     day_to_pass_count++
    #   end
    # end

    start_date + day_to_pass_count
  end

  def business_days_between(start_date, end_date)
    days_between = (end_date - start_date).to_i
    return 0 unless days_between > 0

    whole_weeks, extra_days = days_between.divmod(7)

    unless extra_days.zero?
      extra_days -= if start_date.tomorrow.wday <= end_date.wday
        [start_date.tomorrow.sunday?, end_date.saturday?].count(true)
      else
        2
      end
    end

    (whole_weeks * 5) + extra_days
  end

  def name_w_initials( human_bean )
    human_bean.to_name_w_initials
  end

  def get_link_to_branch(branch)
    branch ? (link_to branch.name, edit_structure_unit_path(branch)) : ''
  end

  def get_link_to_head(branch)
    if branch
      get_link_to_human_bean(branch.head)
    else
      ''
    end
  end

  def get_link_to_human_bean (human_bean, label_class = nil)
    if (label_class == nil)
      link_to human_bean.to_name_w_initials, edit_human_bean_path(human_bean)
    else
      link_to human_bean.to_name_w_initials, edit_human_bean_path(human_bean), :class => label_class
    end
  end

  def get_link_to_structure_unit (structure_unit)
    link_to structure_unit.name, edit_structure_unit_path(structure_unit)
  end

  def get_overdue_tasks (tasks)
    tasks.each do |task|
      if !task.end_actual
        if Time.now > task.end_planned
          overdue_tasks.push(task)
        end
      elsif task.end_actual > task.end_planned
          overdue_tasks.push(task)
      end
    end

    return overdue_tasks
  end
end
