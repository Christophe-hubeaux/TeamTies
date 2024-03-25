import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-save-prono"
export default class extends Controller {

  connect() {
    console.log("hello world")
  }

  submit() {
    this.element.submit();
  }
};