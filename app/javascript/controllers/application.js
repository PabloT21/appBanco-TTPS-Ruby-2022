import { Application } from "@hotwired/stimulus"

//= require jquery
//= require jquery_ujs

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
