// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "@rails/actioncable"

import { Application } from "@hotwired/stimulus"
import ClipboardController from "controllers/clipboard_controller"
import BounceController from "controllers/bounce_controller"

const application = Application.start()
application.register("clipboard", ClipboardController)
application.register("bounce", BounceController)
