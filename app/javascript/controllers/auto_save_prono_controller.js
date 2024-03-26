import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-save-prono"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log(this.inputTargets)
   this.inputTargets.forEach(target => {
      target.classList.remove("is-valid")
    });
  }

  submit() {
    this.element.submit();
  }
};