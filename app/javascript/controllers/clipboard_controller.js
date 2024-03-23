import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  copy() {
    let copyText = this.inputTarget;
    navigator.clipboard.writeText(copyText.value)
      .then(() => {
        console.log('Text copied to clipboard');
      })
      .catch(err => {
        console.error('Error occurred while copying text to clipboard: ', err);
      });
  }
}
