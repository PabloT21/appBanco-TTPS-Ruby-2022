json.extract! schedule, :id,:name :lunes_inicio, :lunes_fin, :martes_inicio, :martes_fin, :miercoles_inicio, :miercoles_fin, :jueves_inicio, :jueves_fin, :viernes_inicio, :viernes_fin, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
