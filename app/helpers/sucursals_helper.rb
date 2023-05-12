module SucursalsHelper

  def check_null(start,end)
    if start.blank?
      "Cerrada"
    else
      "#{start.strftime("%H:%M:%S")} - #{end.strftime("%H:%M:%S")}"
    end
  end
end