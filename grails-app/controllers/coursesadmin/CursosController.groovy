package coursesadmin

class CursosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cursosInstanceList: Cursos.list(params), cursosInstanceTotal: Cursos.count()]
    }

    def create = {
        def cursosInstance = new Cursos()
        cursosInstance.properties = params
        return [cursosInstance: cursosInstance]
    }

    def save = {
        def cursosInstance = new Cursos(params)
        if (cursosInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])}"
            redirect(action: "show", id: cursosInstance.id)
        }
        else {
            render(view: "create", model: [cursosInstance: cursosInstance])
        }
    }

    def show = {
        def cursosInstance = Cursos.get(params.id)
        if (!cursosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cursosInstance: cursosInstance]
        }
    }

    def edit = {
        def cursosInstance = Cursos.get(params.id)
        if (!cursosInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cursosInstance: cursosInstance]
        }
    }

    def update = {
        def cursosInstance = Cursos.get(params.id)
        if (cursosInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cursosInstance.version > version) {
                    
                    cursosInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cursos.label', default: 'Cursos')] as Object[], "Another user has updated this Cursos while you were editing")
                    render(view: "edit", model: [cursosInstance: cursosInstance])
                    return
                }
            }
            cursosInstance.properties = params
            if (!cursosInstance.hasErrors() && cursosInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])}"
                redirect(action: "show", id: cursosInstance.id)
            }
            else {
                render(view: "edit", model: [cursosInstance: cursosInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cursosInstance = Cursos.get(params.id)
        if (cursosInstance) {
            try {
                cursosInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])}"
            redirect(action: "list")
        }
    }
}
