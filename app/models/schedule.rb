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




# FIX ME: Debe poder haber horarios tambien el sábado y domingo.
# Tambien deben poder estar vacíos algunos días


class Schedule < ApplicationRecord
  has_one :sucursal

  validates :name, uniqueness: true
  validates :name, presence: true
  # Valido que el fin sea mayor al inicio
  validates :lunes_fin, comparison: { greater_than: :lunes_inicio } , if: :lunes_inicio?
  validates :martes_fin, comparison: { greater_than: :martes_inicio }, if: :martes_inicio?
  validates :miercoles_fin, comparison: { greater_than: :miercoles_inicio }, if: :miercoles_inicio?
  validates :jueves_fin, comparison: { greater_than: :jueves_inicio }, if: :jueves_inicio?
  validates :viernes_fin, comparison: { greater_than: :viernes_inicio }, if: :viernes_inicio?
  validates :sabado_fin, comparison: { greater_than: :sabado_inicio }, if: :sabado_inicio?
  validates :domingo_fin, comparison: { greater_than: :domingo_inicio }, if: :domingo_inicio?
  validate :validate_empty

  def validate_empty
    if lunes_inicio.nil? and lunes_fin.presence
        errors.add(:lunes_fin,"no puede tener valor si el inicio no tiene.")
    elsif lunes_inicio.presence and lunes_fin.nil?
        errors.add(:lunes_inicio,"no puede tener valor si el fin no tiene.")
    end

    if martes_inicio.nil? and martes_fin.presence
        errors.add(:martes_fin,"no puede tener valor si el inicio no tiene.")
    elsif martes_inicio.presence and martes_fin.nil?
        errors.add(:martes_inicio,"no puede tener valor si el fin no tiene.")
    end

    if miercoles_inicio.nil? and miercoles_fin.presence
        errors.add(:miercoles_fin,"no puede tener valor si el inicio no tiene.")
    elsif miercoles_inicio.presence and miercoles_fin.nil?
        errors.add(:miercoles_inicio,"no puede tener valor si el fin no tiene.")
    end

    if jueves_inicio.nil? and jueves_fin.presence
        errors.add(:jueves_fin,"no puede tener valor si el inicio no tiene.")
    elsif jueves_inicio.presence and jueves_fin.nil?
        errors.add(:jueves_inicio,"no puede tener valor si el fin no tiene.")
    end

    if viernes_inicio.nil? and viernes_fin.presence
        errors.add(:viernes_fin,"no puede tener valor si el inicio no tiene.")
    elsif viernes_inicio.presence and viernes_fin.nil?
        errors.add(:viernes_inicio,"no puede tener valor si el fin no tiene.")
    end

    if sabado_inicio.nil? and sabado_fin.presence
        errors.add(:sabado_fin,"no puede tener valor si el inicio no tiene.")
    elsif sabado_inicio.presence and sabado_fin.nil?
        errors.add(:sabado_inicio,"no puede tener valor si el fin no tiene.")
    end
    
    if domingo_inicio.nil? and domingo_fin.presence
        errors.add(:domingo_fin,"no puede tener valor si el inicio no tiene.")
    elsif domingo_inicio.presence and domingo_fin.nil?
        errors.add(:domingo_inicio,"no puede tener valor si el fin no tiene.")
    end
  end

  def individual_empty_validation(inicio,fin)
    if inicio.nil? and fin.presence
      errors.add(fin,"no puede tener valor si el inicio no tiene.")
    elsif inicio.presence and fin.nil?
      errors.add(inicio,"no puede tener valor si el fin no tiene.")
    end
  end


  def validate_time(day,hour)
    case day
    when "Monday"
        validate_day_schedule(lunes_inicio,lunes_fin,hour)
    when "Tuesday"
        validate_day_schedule(martes_inicio,martes_fin,hour)
    when "Wednesday"
        validate_day_schedule(miercoles_inicio,miercoles_fin,hour)
    when "Thursday"
        validate_day_schedule(jueves_inicio,jueves_fin,hour)
    when "Friday"
        validate_day_schedule(viernes_inicio,viernes_fin,hour)
    when "Saturday"
        validate_day_schedule(sabado_inicio,sabado_fin,hour)
    when "Sunday"
        validate_day_schedule(domingo_inicio,domingo_fin,hour)
    end
  end

  def validate_day_schedule(inicio,fin,hour)
    if(inicio.presence)
      inicio = inicio.strftime("%H:%M:%S")
      fin = fin.strftime("%H:%M:%S")
      if(hour > inicio && hour < fin)
        return true
      else
        return false
      end
    end
  end

end
