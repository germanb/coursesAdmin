package coursesadmin

class Empleados {

    static constraints = {
		codigo (blank:false, nullable:false)
		nombre (blank:false, nullable:false)
		direccion (blank:false, nullable:false)
		telefono (blank:false, nullable:false)
		nacimiento (blank:false, nullable:false)
		sexo (blank:false, nullable:false)
		
    }
	String codigo
	String nombre
	String direccion
	String telefono
	String nacimiento
	String sexo
	String firma
	Long salario
	String capacitado

}
