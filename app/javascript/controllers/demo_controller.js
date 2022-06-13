// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "output"]

  pushme() {
    this.outputTarget.textContent = `Hello, ${this.contentTarget.value}!`
  }

  pushit() {
    this.outputTarget.textContent = `Hi, ${this.contentTarget.value}!`
  }
}
