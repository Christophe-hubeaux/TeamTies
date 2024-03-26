import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newteam"
export default class extends Controller {
  static targets = ["form", "btn"]

  connect() {
    console.log("Hello")
  }
  display() {
    this.formTarget.classList.toggle("d-none")
    this.btnTarget.classList.toggle("d-none")
  }
}
