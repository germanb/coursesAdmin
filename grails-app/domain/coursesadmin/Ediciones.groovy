package coursesadmin

class Ediciones {

	static belongsTo = [curso:Cursos]
	
    static constraints = {
		lugar (blank:false, nullable:false)
		fecha (blank:false, nullable:false)
		horario (blank:false, nullable:false)
    }
	String lugar
	String fecha
	String horario
}
