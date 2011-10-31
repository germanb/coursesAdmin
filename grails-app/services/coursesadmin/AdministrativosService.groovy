package coursesadmin

class AdministrativosService {
	
	static transactional = true
	def grailsApplication
	
	def prepareResponse(domainInstance) {
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		def postResponse = new AjaxPostResponseController()
		if (domainInstance.hasErrors()) {
			g.eachError(bean: domainInstance) {
				postResponse.errors."${it.field}" = g.message(error: it)
			}
			postResponse.success = false
			postResponse.message = "There was an error"
		} else {
			postResponse.success = true
			postResponse.message = "Success"
		}
		postResponse.domainInstance = domainInstance
		return postResponse
	}
	
	
	def serviceMethod() {
	}
}
