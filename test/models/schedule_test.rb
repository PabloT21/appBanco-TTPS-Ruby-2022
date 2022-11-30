# == Schema Information
#
# Table name: schedules
#
#  id              :bigint           not null, primary key
#  juevesFin       :time
#  juevesInicio    :time
#  lunesFin        :time
#  lunesInicio     :time
#  martesFin       :time
#  martesInicio    :time
#  miercolesFin    :time
#  miercolesInicio :time
#  viernesFin      :time
#  viernesInicio   :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
