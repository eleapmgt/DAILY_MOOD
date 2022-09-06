import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-categories"
export default class extends Controller {
  static targets = ["chosen", "other"]
  connect() {}

  remove(event) {
    const element = event.currentTarget
    const url = event.currentTarget.dataset.url
    const options = {
      method: "DELETE",
      headers: { "Accept": "text/plain", "Content-Type": "application/json" }
    }
    fetch(url, options)
    .then(response => response.text())
    .then(data => {
      if (element) {
        element.remove()
      }
      this.otherTarget.insertAdjacentHTML("beforeend", data)
    })
  }

  add(event) {
    const element = event.currentTarget
    const url = event.currentTarget.dataset.url
    const options = {
      method: "POST",
      headers: { "Accept": "text/plain", "Content-Type": "application/json" }
    }
    fetch(url, options)
    .then(response => response.text())
    .then(data => {
      if (element) {
        element.remove()
      }
      this.chosenTarget.insertAdjacentHTML("beforeend", data)
    })
  }
}
