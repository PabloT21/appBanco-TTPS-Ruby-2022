# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint           not null, primary key
#  dirección   :string
#  nombre      :string
#  telefono    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  schedule_id :bigint           not null
#
# Indexes
#
#  index_sucursals_on_nombre       (nombre) UNIQUE
#  index_sucursals_on_schedule_id  (schedule_id)
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#
require "test_helper"

class SucursalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
