import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["body"]
  connect() {
  }
  toggleOpen() {
    this.bodyTarget.toggleAttribute("hidden")
  }
}
