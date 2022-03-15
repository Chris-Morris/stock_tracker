import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["greeting"]

  static values = { name: String }

  connect() {
    console.log(this.nameValue)
    this.greetingTarget.textContent = "Welcome, " + this.nameValue
  }

  nameValueChanged() {
    this.greetingTarget.textContent = "Welcome, " + this.nameValue
  }
}