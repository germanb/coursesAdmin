package coursesadmin

class Empleados {

    static constraints = {
		nombre (blank:false, nullable:false)
		direccion (blank:false, nullable:false)
		telefono (blank:false, nullable:false)
		nacimiento (blank:false, nullable:false)
		sexo (blank:false, nullable:false)
		tipo (blank:true, nullable:true)
		
    }
	String nombre
	String direccion
	String telefono
	String nacimiento
	String sexo
	String tipo
	
	Long salario
	String capacitado

}
