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
class Schedule < ApplicationRecord
    has_one :sucursal

    validates :lunesInicio,:lunesFin, :martesInicio, :martesFin, :miercolesInicio, :miercolesFin, :juevesInicio, :juevesFin, :viernesInicio, :viernesFin, presence:true
    # Valido que el fin sea mayor al inicio
    validates :lunesFin, comparison: { greater_than: :lunesInicio }
    validates :martesFin, comparison: { greater_than: :martesInicio }
    validates :miercolesFin, comparison: { greater_than: :miercolesInicio }
    validates :juevesFin, comparison: { greater_than: :juevesInicio }
    validates :viernesFin, comparison: { greater_than: :viernesInicio }



end
