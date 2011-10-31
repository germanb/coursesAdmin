package coursesadmin

class AdministrativosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administrativosInstanceList: Administrativos.list(params), administrativosInstanceTotal: Administrativos.count()]
    }

    def create = {
        def administrativosInstance = new Administrativos()
        administrativosInstance.properties = params
        return [administrativosInstance: administrativosInstance]
    }

    def save = {
        def administrativosInstance = new Administrativos(params)
        if (administrativosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), administrativosInstance.id])}"
            redirect(action: "show", id: administrativosInstance.id)
        }
        else {
            render(view: "create", model: [administrativosInstance: administrativosInstance])
        }
    }

    def show = {
        def administrativosInstance = Administrativos.get(params.id)
        if (!administrativosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [administrativosInstance: administrativosInstance])
        }
    }

    def edit = {
        def administrativosInstance = Administrativos.get(params.id)
        if (!administrativosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [administrativosInstance: administrativosInstance]
        }
    }
	
    def update = {
        def administrativosInstance = Administrativos.get(params.id)
        if (administrativosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (administrativosInstance.version > version) {
                    
                    administrativosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'administrativos.label', default: 'Administrativos')] as Object[], "Another user has updated this Administrativos while you were editing")
                    render(view: "edit", model: [administrativosInstance: administrativosInstance])
                    return
                }
            }
            administrativosInstance.properties = params
            if (!administrativosInstance.hasErrors() && administrativosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), administrativosInstance.id])}"
                redirect(action: "show", id: administrativosInstance.id)
            }
            else {
                render(view: "edit", model: [administrativosInstance: administrativosInstance])
            }
        }
        else {
		
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def administrativosInstance = Administrativos.get(params.id)
        if (administrativosInstance) {
            try {
                administrativosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'administrativos.label', default: 'Administrativos'), params.id])}"
            redirect(action: "list")
        }
    }
}
