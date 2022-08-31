import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  /* static get targets() {
    return ['range', 'value', 'rangeFrom', 'rangeTo', 'valueFrom', 'valueTo', 'form', 'input']
  } */

  static targets = [ "input", 'form', 'range', 'value' ]

  connect() {
    if (this.hasInputTarget) {
      this.valueTarget.innerHTML = this.inputTarget.value
      this.rangeTarget.value = this.inputTarget.value
    }
   /*  if (this.hasValueToTarget)   { this.valueToTarget.innerHTML = this.rangeToTarget.value }
    if (this.hasValueFromTarget) { this.valueFromTarget.innerHTML = this.rangeFromTarget.value } */
  }

  updateValue(evt) {
    this.valueTarget.innerHTML = evt.currentTarget.value;
    console.log(this.formTarget)
    this.inputTarget.value = evt.currentTarget.value
    this.formTarget.submit()
    // const form = this.formTarget
   /*  fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain", "X-CSRF-Token": document.querySelector("[name='csrf-token']").content },
      body: formData,
    }) */

  }

  updateFromValue() {
    /* let fromValue = this.rangeFromTarget.value
    let toValue = this.rangeToTarget.value */

    if (fromValue >= toValue) {
      this.rangeToTarget.value = fromValue
      this.valueToTarget.innerHTML = fromValue
    }

    this.valueFromTarget.innerHTML = fromValue
  }

  updateToValue() {
    let fromValue = this.rangeFromTarget.value
    let toValue = this.rangeToTarget.value

    if (toValue <= fromValue) {
      this.rangeFromTarget.value = toValue
      this.valueFromTarget.innerHTML = toValue
    }
    this.valueToTarget.innerHTML = toValue
  }

}
