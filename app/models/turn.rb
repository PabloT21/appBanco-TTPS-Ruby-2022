# == Schema Information
#
# Table name: turns
#
#  id           :bigint           not null, primary key
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
class Turn < ApplicationRecord
  belongs_to :sucursal
  validates :fecha,:hora,:reason,:sucursal_id, presence: true
  validate :validate_date
  attribute :state, :integer, default: 0

  belongs_to :creador, :class_name => "User"
  belongs_to :empleado, :class_name => "User", optional: true


  def validate_date
    return unless errors.blank?
    sucursal = Sucursal.find_by_id(sucursal_id)
    if sucursal.nil?
      errors.add(:sucursal_id, " la sucursal no existe")
    else
        day = fecha.strftime("%A")
        hour = hora.strftime("%H:%M:%S")
        schedule = Schedule.find_by_id(sucursal.schedule_id)
        if (!schedule.validate_time(day,hour))
          errors.add(:fecha, " no se encuentra dentro de la franja horaria de la sucursal para el día elegido")
        end
    end
  end

end
