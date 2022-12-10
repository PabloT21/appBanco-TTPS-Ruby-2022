# Banco APP

## Aplicación realizada para la materia de TTPS Opción Ruby 2022
## Alumno: Pablo Terrone

## Especificaciones técnicas:

* Base de datos MySQL

* Versión de Ruby: 3.1.2

* Versión de Ruby on Rails: 7.0.4

## Comentarios sobre decisiones de diseño:

* Decidi hacer un borrado físico al cancelar un turno, ya que no debian verse en la aplicación por lo que considere innecesario hacer un borrado lógico.

* Decidi guardar la referencia al empleado que atiende un turno como una clave foranea (usando el id del empleado), ya que si en el futuro quiero mostrar otro campo del usuario (Por ejemplo, agrego nombre de usuario y quiero mostrar eso) no hay que actualizar todos los datos de referencia. El problema es que esto puede generar problemas si se hace un borrado físico del usuario que lo atendio.

* Le di a los usuarios normales permisos para poder ver los datos de todas las sucursales, para que puedan consultar los horarios.