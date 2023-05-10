# == Schema Information
#
# Table name: schedules
#
#  id               :bigint           not null, primary key
#  domingo_fin      :time
#  domingo_inicio   :time
#  jueves_fin       :time
#  jueves_inicio    :time
#  lunes_fin        :time
#  lunes_inicio     :time
#  martes_fin       :time
#  martes_inicio    :time
#  miercoles_fin    :time
#  miercoles_inicio :time
#  name             :string
#  sabado_fin       :time
#  sabado_inicio    :time
#  viernes_fin      :time
#  viernes_inicio   :time
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
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
