import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["displaySlogan","displaySearch","mainSearch"]
  connect() {
  }
  displaySearch(event) {
    event.preventDefault()
    setTimeout((e)=> {
      console.log(e, 'hola');
      this.mainSearchTarget.submit()
    }, 3000);
    this.displaySloganTarget.style.display = 'none'
    this.displaySearchTarget.classList.remove("display-search")
  }
}
