# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Generando horarios"

horario1 = Schedule.create(name: "Mañana" , lunes_inicio: Time.utc(2022,"jan",1,10,00,00) , lunes_fin: Time.utc(2022,"jan",1,18,00,00), martes_inicio: Time.utc(2022,"jan",1,8,00,00), martes_fin: Time.utc(2022,"jan",1,16,00,00), jueves_inicio: Time.utc(2022,"jan",1,12,00,00), jueves_fin: Time.utc(2022,"jan",1,18,00,00))

horario2 =Schedule.create(name: "Nocturno" , lunes_inicio: Time.utc(2022,"jan",1,18,00,00) , lunes_fin: Time.utc(2022,"jan",1,23,00,00), martes_inicio: Time.utc(2022,"jan",1,18,00,00), martes_fin: Time.utc(2022,"jan",1,23,00,00),miercoles_inicio:Time.utc(2022,"jan",1,18,30,00), miercoles_fin: Time.utc(2022,"jan",1,23,30,00), jueves_inicio: Time.utc(2022,"jan",1,18,30,00), jueves_fin: Time.utc(2022,"jan",1,23,00,00), viernes_inicio: Time.utc(2022,"jan",1,16,00,00), viernes_fin: Time.utc(2022,"jan",1,23,00,00))

horario3 =Schedule.create(name: "Fin de semana" , viernes_inicio: Time.utc(2022,"jan",1,10,00,00) , viernes_fin: Time.utc(2022,"jan",1,16,00,00), sabado_inicio: Time.utc(2022,"jan",1,10,00,00), sabado_fin: Time.utc(2022,"jan",1,18,00,00),domingo_inicio:Time.utc(2022,"jan",1,9,30,00), domingo_fin: Time.utc(2022,"jan",1,16,30,00), lunes_inicio: Time.utc(2022,"jan",1,8,30,00), lunes_fin: Time.utc(2022,"jan",1,14,00,00))

p "Generando sucursales"

sucursal1 =Sucursal.create(nombre: "Tolosa", telefono: "221 23322", dirección: "Av 112", schedule_id: horario1.id)

sucursal2 =Sucursal.create(nombre: "Centro", telefono: "221 22111", dirección: "Av 7 677", schedule: horario2)

p "Generando usuarios"

usuario1 = User.create(email: "juanperez@gmail.com", password:"juanperez", password_confirmation:"juanperez", rol:"usuario")

usuario2 = User.create(email: "ignacio@gmail.com", password:"ignacio", password_confirmation:"ignacio", rol:"usuario")

usuarioEmpleado = User.create(email: "tomasdominguez@gmail.com", password:"dominguez", password_confirmation:"dominguez", rol:"empleado", sucursal: sucursal1)
usuarioEmpleado2 = User.create(email: "martin@gmail.com", password:"martin", password_confirmation:"martin", rol:"empleado", sucursal: sucursal2)

usuarioAdmin = User.create(email: "admin123@gmail.com", password:"abcd1234", password_confirmation:"abcd1234", rol:"admin")

p "Generando turnos"

turno1= Turn.create(sucursal_id: sucursal1.id, state: 0, fecha: Time.utc(2022,"dec",26,13,30,00), hora: Time.utc(2022,"dec",19,14,00,00) , reason: "Necesito cambiar mi tarjeta", creador_id: usuario1.id )

turno2= Turn.create(sucursal_id: sucursal2.id, state: 0, fecha: Time.utc(2022,"dec",26,13,30,00) , hora: Time.utc(2022,"dec",26,22,30,00) , reason: "Quiero cambiar mi clave", creador_id: usuario2.id ) 