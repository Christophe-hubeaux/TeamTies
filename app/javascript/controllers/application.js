import { Application } from "@hotwired/stimulus"
import FadeOutController from "./fade_out_controller"
import BounceController from "./bounce_controller"
import ClipboardController from "./clipboard_controller"
// import { propertiesForValueDefinitionPair } from "./@hotwired/stimulus/dist/types/core/value_properties"
const application = Application.start()
application.register("fade_out", FadeOutController)
application.register("bounce", BounceController)
application.register("clipboard", ClipboardController)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
