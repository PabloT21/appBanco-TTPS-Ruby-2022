# == Schema Information
#
# Table name: sucursals
#
#  id          :bigint           not null, primary key
#  dirección   :string(255)
#  nombre      :string(255)
#  telefono    :string(255)
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
class Sucursal < ApplicationRecord
  belongs_to :schedule

  validates :schedule_id, uniqueness: true
  validates :dirección, :nombre, :telefono, presence: true

  
  #Validacion personalizada:
  # validate :nombre_funcion 
  #
  #def nombre_funcion
  # emd
end
