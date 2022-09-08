import { Controller } from "@hotwired/stimulus"

import Sortable from 'stimulus-sortable'

export default class extends Sortable {
  connect() {
    console.log("coucou");
    super.connect()
    console.log('Do what you want here.')

    // // The sortable.js instance.
    // this.sortable

    // // Your options
    // this.options

    // // Your default options
    // this.defaultOptions
  }

  // You can override the `end` method here.
  end({ item, newIndex }) {
    super.end({ item, newIndex })
  }

  // You can set default options in this getter for all sortable elements.
  get defaultOptions() {
    return {
      animation: 500,
    }
  }
}
