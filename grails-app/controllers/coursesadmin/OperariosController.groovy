package coursesadmin

class OperariosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [operariosInstanceList: Operarios.list(params), operariosInstanceTotal: Operarios.count()]
    }

    def create = {
        def operariosInstance = new Operarios()
        operariosInstance.properties = params
        return [operariosInstance: operariosInstance]
    }

    def save = {
        def operariosInstance = new Operarios(params)
        if (operariosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'operarios.label', default: 'Operarios'), operariosInstance.id])}"
            redirect(action: "show", id: operariosInstance.id)
        }
        else {
            render(view: "create", model: [operariosInstance: operariosInstance])
        }
    }

    def show = {
        def operariosInstance = Operarios.get(params.id)
        if (!operariosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
            redirect(action: "list")
        }
        else {
            [operariosInstance: operariosInstance]
        }
    }

    def edit = {
        def operariosInstance = Operarios.get(params.id)
        if (!operariosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [operariosInstance: operariosInstance]
        }
    }

    def update = {
        def operariosInstance = Operarios.get(params.id)
        if (operariosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (operariosInstance.version > version) {
                    
                    operariosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'operarios.label', default: 'Operarios')] as Object[], "Another user has updated this Operarios while you were editing")
                    render(view: "edit", model: [operariosInstance: operariosInstance])
                    return
                }
            }
            operariosInstance.properties = params
            if (!operariosInstance.hasErrors() && operariosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'operarios.label', default: 'Operarios'), operariosInstance.id])}"
                redirect(action: "show", id: operariosInstance.id)
            }
            else {
                render(view: "edit", model: [operariosInstance: operariosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def operariosInstance = Operarios.get(params.id)
        if (operariosInstance) {
            try {
                operariosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'operarios.label', default: 'Operarios'), params.id])}"
            redirect(action: "list")
        }
    }
}
