# == Schema Information
#
# Table name: turns
#
#  id           :bigint           not null, primary key
#  comentario   :string(255)
#  fecha        :date
#  hora         :time
#  reason       :string(255)
#  state        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creador_id   :bigint
#  empleados_id :bigint
#  sucursal_id  :bigint           not null
#
# Indexes
#
#  index_turns_on_creador_id    (creador_id)
#  index_turns_on_empleados_id  (empleados_id)
#  index_turns_on_sucursal_id   (sucursal_id)
#
# Foreign Keys
#
#  fk_rails_...  (creador_id => users.id)
#  fk_rails_...  (empleados_id => users.id)
#  fk_rails_...  (sucursal_id => sucursals.id)
#
require "test_helper"

class TurnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
