package coursesadmin

class EdicionesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [edicionesInstanceList: Ediciones.list(params), edicionesInstanceTotal: Ediciones.count()]
    }

    def create = {
        def edicionesInstance = new Ediciones()
        edicionesInstance.properties = params
        return [edicionesInstance: edicionesInstance]
    }

    def save = {
        def edicionesInstance = new Ediciones(params)
        if (edicionesInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), edicionesInstance.id])}"
            redirect(action: "show", id: edicionesInstance.id)
        }
        else {
            render(view: "create", model: [edicionesInstance: edicionesInstance])
        }
    }

    def show = {
        def edicionesInstance = Ediciones.get(params.id)
        if (!edicionesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
            redirect(action: "list")
        }
        else {
            [edicionesInstance: edicionesInstance]
        }
    }

    def edit = {
        def edicionesInstance = Ediciones.get(params.id)
        if (!edicionesInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [edicionesInstance: edicionesInstance]
        }
    }

    def update = {
        def edicionesInstance = Ediciones.get(params.id)
        if (edicionesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (edicionesInstance.version > version) {
                    
                    edicionesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ediciones.label', default: 'Ediciones')] as Object[], "Another user has updated this Ediciones while you were editing")
                    render(view: "edit", model: [edicionesInstance: edicionesInstance])
                    return
                }
            }
            edicionesInstance.properties = params
            if (!edicionesInstance.hasErrors() && edicionesInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), edicionesInstance.id])}"
                redirect(action: "show", id: edicionesInstance.id)
            }
            else {
                render(view: "edit", model: [edicionesInstance: edicionesInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def edicionesInstance = Ediciones.get(params.id)
        if (edicionesInstance) {
            try {
                edicionesInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ediciones.label', default: 'Ediciones'), params.id])}"
            redirect(action: "list")
        }
    }
}
