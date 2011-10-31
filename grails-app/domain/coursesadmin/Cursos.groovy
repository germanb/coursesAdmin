package coursesadmin

class Cursos {

    static constraints = {
		nombre (blank:false, nullable:false)
		descripcion (blank:false, nullable:false)
		destinatarios (blank:false, nullable:false)
		horas (blank:false, nullable:false)
		costo (blank:false, nullable:false)
    }

	String nombre
	String descripcion
	String horas
	String costo
	String destinatarios
	Cursos obligatorio
}
