package coursesadmin

class EmpleadosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [empleadosInstanceList: Empleados.list(params), empleadosInstanceTotal: Empleados.count()]
    }

    def create = {
        def empleadosInstance = new Empleados()
        empleadosInstance.properties = params
        return [empleadosInstance: empleadosInstance]
    }

    def save = {
        def empleadosInstance = new Empleados(params)
        if (empleadosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'empleados.label', default: 'Empleados'), empleadosInstance.id])}"
            redirect(action: "show", id: empleadosInstance.id)
        }
        else {
            render(view: "create", model: [empleadosInstance: empleadosInstance])
        }
    }

    def show = {
        def empleadosInstance = Empleados.get(params.id)
        if (!empleadosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
            redirect(action: "list")
        }
        else {
            [empleadosInstance: empleadosInstance]
        }
    }

    def edit = {
        def empleadosInstance = Empleados.get(params.id)
        if (!empleadosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [empleadosInstance: empleadosInstance]
        }
    }

    def update = {
        def empleadosInstance = Empleados.get(params.id)
        if (empleadosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (empleadosInstance.version > version) {
                    
                    empleadosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'empleados.label', default: 'Empleados')] as Object[], "Another user has updated this Empleados while you were editing")
                    render(view: "edit", model: [empleadosInstance: empleadosInstance])
                    return
                }
            }
            empleadosInstance.properties = params
            if (!empleadosInstance.hasErrors() && empleadosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'empleados.label', default: 'Empleados'), empleadosInstance.id])}"
                redirect(action: "show", id: empleadosInstance.id)
            }
            else {
                render(view: "edit", model: [empleadosInstance: empleadosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def empleadosInstance = Empleados.get(params.id)
        if (empleadosInstance) {
            try {
                empleadosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def selectType = {
		def empleadosInstance = Empleados.get(params.id)
		if (!empleadosInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empleados.label', default: 'Empleados'), params.id])}"
			redirect(action: "list")
		}
		else {
			render(view: "selectType", model: [empleadosInstance: empleadosInstance])
		}
	}
}
