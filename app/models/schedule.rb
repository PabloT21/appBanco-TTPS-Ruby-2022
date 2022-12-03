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




# FIX ME: Debe poder haber horarios tambien el sábado y domingo.
# Tambien deben poder estar vacíos algunos días


class Schedule < ApplicationRecord
    has_one :sucursal

    validates :name, uniqueness: true
    # Valido que el fin sea mayor al inicio
    validates :lunesFin, comparison: { greater_than: :lunesInicio } , if: :lunesInicio?
    validates :martesFin, comparison: { greater_than: :martesInicio }, if: :martesInicio?
    validates :miercolesFin, comparison: { greater_than: :miercolesInicio }, if: :miercolesInicio?
    validates :juevesFin, comparison: { greater_than: :juevesInicio }, if: :juevesInicio?
    validates :viernesFin, comparison: { greater_than: :viernesInicio }, if: :viernesInicio?
    validates :sabadoFin, comparison: { greater_than: :sabadoInicio }, if: :sabadoInicio?
    validates :domingoFin, comparison: { greater_than: :domingoInicio }, if: :domingoInicio?
    validate :validate_empty

    def validate_empty
        if lunesInicio.nil? and lunesFin.presence
            errors.add(:lunesFin,"no puede tener valor si el inicio no tiene.")
        elsif lunesInicio.presence and lunesFin.nil?
            errors.add(:lunesInicio,"no puede tener valor si el fin no tiene.")
        end

        if martesInicio.nil? and martesFin.presence
            errors.add(:martesFin,"no puede tener valor si el inicio no tiene.")
        elsif martesInicio.presence and martesFin.nil?
            errors.add(:martesInicio,"no puede tener valor si el fin no tiene.")
        end

        if miercolesInicio.nil? and miercolesFin.presence
            errors.add(:miercolesFin,"no puede tener valor si el inicio no tiene.")
        elsif miercolesInicio.presence and miercolesFin.nil?
            errors.add(:miercolesInicio,"no puede tener valor si el fin no tiene.")
        end

        if juevesInicio.nil? and juevesFin.presence
            errors.add(:juevesFin,"no puede tener valor si el inicio no tiene.")
        elsif juevesInicio.presence and juevesFin.nil?
            errors.add(:juevesInicio,"no puede tener valor si el fin no tiene.")
        end

        if viernesInicio.nil? and viernesFin.presence
            errors.add(:viernesFin,"no puede tener valor si el inicio no tiene.")
        elsif viernesInicio.presence and viernesFin.nil?
            errors.add(:viernesInicio,"no puede tener valor si el fin no tiene.")
        end

        if sabadoInicio.nil? and sabadoFin.presence
            errors.add(:sabadoFin,"no puede tener valor si el inicio no tiene.")
        elsif sabadoInicio.presence and sabadoFin.nil?
            errors.add(:sabadoInicio,"no puede tener valor si el fin no tiene.")
        end
        
        if domingoInicio.nil? and domingoFin.presence
            errors.add(:domingoFin,"no puede tener valor si el inicio no tiene.")
        elsif domingoInicio.presence and domingoFin.nil?
            errors.add(:domingoInicio,"no puede tener valor si el fin no tiene.")
        end
end

def individual_empty_validation(inicio,fin)
    if inicio.nil? and fin.presence
        errors.add(fin,"no puede tener valor si el inicio no tiene.")
    elsif inicio.presence and fin.nil?
        errors.add(inicio,"no puede tener valor si el fin no tiene.")
    end
end


end
