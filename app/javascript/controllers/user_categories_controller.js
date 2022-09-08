import { Controller } from "@hotwired/stimulus"
//import { getDefaultEventNameForElement } from "@hotwired/stimulus/dist/types/core/action"
// import { electron } from "webpack"


function updateCategory() {
  const others = document.getElementsByClassName("other-category")
  const chosens = document.getElementsByClassName("chosen-category")
  Array.from(others).forEach((elt) => {
    if (chosens.length >= 3) {
      elt.dataset["action"] = "";
      elt.classList.add("disabled-category");
    } else {
      elt.dataset["action"] = "click->user-categories#add";
      elt.classList.remove("disabled-category");
    }
  });
}


// Connects to data-controller="user-categories"
export default class extends Controller {
  static targets = ["chosen", "other"]

  connect() {
    updateCategory();
  }

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
      updateCategory();
    })
  }

  add(event) {
    console.log("gatchou")
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
      updateCategory();
    })
  }
}
