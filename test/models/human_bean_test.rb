require 'test_helper'

class HumanBeanTest < ActiveSupport::TestCase

  def test_should_not_have_zero_for_occupancy_when_there_is_pending_tasks
    human_bean = HumanBean.new
    human_bean.build_tasks(:end_planned => Time.now + 259200, :begin_actual => Time.now)
    assert_not_equal 0, human_bean.occupancy
  end
  
end
