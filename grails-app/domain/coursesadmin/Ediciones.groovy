package coursesadmin

class Ediciones {

    static constraints = {
		lugar (blank:false, nullable:false)
		fecha (blank:false, nullable:false)
		horario (blank:false, nullable:false)
		codigo (blank:false, nullable:false)
    }
	String lugar
	String fecha
	String horario
	String codigo
	Cursos curso
}
