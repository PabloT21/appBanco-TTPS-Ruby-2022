# == Schema Information
#
# Table name: schedules
#
#  id              :bigint           not null, primary key
#  domingoFin      :time
#  domingoInicio   :time
#  juevesFin       :time
#  juevesInicio    :time
#  lunesFin        :time
#  lunesInicio     :time
#  martesFin       :time
#  martesInicio    :time
#  miercolesFin    :time
#  miercolesInicio :time
#  name            :string(255)
#  sabadoFin       :time
#  sabadoInicio    :time
#  viernesFin      :time
#  viernesInicio   :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_schedules_on_name  (name) UNIQUE
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
