package coursesadmin

import java.awt.List;

import groovy.sql.Sql;

class ParticipacionesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [participacionesInstanceList: Participaciones.list(params), participacionesInstanceTotal: Participaciones.count()]
    }

	def createConsulta = {
		
		def dataSource
		Sql sql = Sql.newInstance( 'jdbc:mysql://127.0.0.1:3306/courses', 'root',
			'123456', 'org.hibernate.dialect.MySQL5InnoDBDialect' )
		def resultSet  = []
		sql.eachRow( "call GetEmpleadosCursanFecha(${params.fecha},${params.fecha2})" ) { 
			def result = [:]
			result.nombre = it.nombre
			result.destinatarios =  it.destinatarios
			result.tipo = it.tipo
			result.horas =  it.horas
			result.fecha = it.fecha
			resultSet.add(result)
			println "$it.destinatarios -- ${it.nombre} --" }

		[resultSet: resultSet]
	}
    def create = {
        def participacionesInstance = new Participaciones()
        participacionesInstance.properties = params
        return [participacionesInstance: participacionesInstance]
    }

    def save = {
		if(params.edicion != "null"){
			params.edicion = Ediciones.get(params.edicion)
		}else{
			params.edicion = null
		}
		if(params.empleado != "null"){
			def empleadosInstanceObligatorio = Empleados.get(params.empleado as Long)
			params.empleado = empleadosInstanceObligatorio
		}else{
			params.empleado = null
		}
		
        def participacionesInstance = new Participaciones(params)
        if (participacionesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), participacionesInstance.id])}"
            redirect(action: "show", id: participacionesInstance.id)
        }
        else {
            render(view: "create", model: [participacionesInstance: participacionesInstance])
        }
    }

    def show = {
        def participacionesInstance = Participaciones.get(params.id)
        if (!participacionesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
            redirect(action: "list")
        }
        else {
            [participacionesInstance: participacionesInstance]
        }
    }

    def edit = {
        def participacionesInstance = Participaciones.get(params.id)
        if (!participacionesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [participacionesInstance: participacionesInstance]
        }
    }

    def update = {
        def participacionesInstance = Participaciones.get(params.id)
        if (participacionesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (participacionesInstance.version > version) {
                    
                    participacionesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'participaciones.label', default: 'Participaciones')] as Object[], "Another user has updated this Participaciones while you were editing")
                    render(view: "edit", model: [participacionesInstance: participacionesInstance])
                    return
                }
            }
            participacionesInstance.properties = params
            if (!participacionesInstance.hasErrors() && participacionesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), participacionesInstance.id])}"
                redirect(action: "show", id: participacionesInstance.id)
            }
            else {
                render(view: "edit", model: [participacionesInstance: participacionesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def participacionesInstance = Participaciones.get(params.id)
        if (participacionesInstance) {
            try {
                participacionesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'participaciones.label', default: 'Participaciones'), params.id])}"
            redirect(action: "list")
        }
    }
}
