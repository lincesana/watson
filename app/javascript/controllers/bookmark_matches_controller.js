import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-matches"
export default class extends Controller {
  static targets = ["bookmarksHolder", "name"]

  connect() {
    console.log("hello");
  }


  filter(event) {
    event.preventDefault()
    const url = `${event.target.href}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        console.log( this.bookmarksHolderTarget);
        this.bookmarksHolderTarget.innerHTML = data
      })
      this.nameTarget.innerText = event.target.innerText
  }
}
