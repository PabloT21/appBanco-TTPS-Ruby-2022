module SchedulesHelper

  def check_null(inicio,fin)
    if inicio.blank?
      "Cerrada"
    else
      "#{inicio.strftime("%H:%M:%S")} - #{fin.strftime("%H:%M:%S")}"
    end
  end
end