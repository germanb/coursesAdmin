package coursesadmin

class Participaciones {

    static constraints = {
		edicion (nullable:false)
		empleado (nullable:false)
		condicion (nullable:false, blank:false)
    }
	
	Ediciones edicion
	Empleados empleado
	String condicion
}
