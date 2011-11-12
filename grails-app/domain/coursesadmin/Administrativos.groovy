package coursesadmin

class Administrativos {

    static constraints = {
		oficina(blank:false, nullable:false)
		tarea(blank:false, nullable:false)
		categoria(blank:false, nullable:false)
    }
	String oficina
	String tarea
	String categoria

}
