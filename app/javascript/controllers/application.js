import { Application } from "@hotwired/stimulus"
import BounceController from "./bounce_controller"
import ClipboardController from "./clipboard_controller"
const application = Application.start()
application.register("bounce", BounceController)
application.register("clipboard", ClipboardController)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
