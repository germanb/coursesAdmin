package coursesadmin

class Cursos {

    static constraints = {
		nombre (blank:false, nullable:false, unique:true)
		descripcion (blank:false, nullable:false)
		destinatarios (blank:false, nullable:false)
		horas (blank:false, nullable:false)
		costo (blank:false, nullable:false)
		obligatorio (nullable:true)
    }

	String nombre
	String descripcion
	String horas
	String costo
	String destinatarios
	Cursos obligatorio
}
