import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quarter", "annual", "quarterSheet", "annualSheet"]

  static classes = ["unpressed", "pressed", "hide"]

  connect() {

  }

  quarter(event) {
    event.preventDefault()

    this.quarterSheetTarget.classList.remove(this.hideClass)
    this.annualSheetTarget.classList.add(this.hideClass)
    if (!this.quarterTarget.classList.contains(this.pressedClass)) {
      this.annualTarget.classList.remove(this.pressedClass)
      this.annualTarget.classList.add(this.unpressedClass)
      this.quarterTarget.classList.add(this.pressedClass)
      this.greetingTarget.classList.add(this.pressedClass)
      this.annualSheetTarget.classList.add(this.hideClass)
    }
  }

  annual(event) {
    event.preventDefault()

    this.annualSheetTarget.classList.remove(this.hideClass)
    this.quarterSheetTarget.classList.add(this.hideClass)
    if (!this.annualTarget.classList.contains(this.pressedClass)) {
      this.quarterTarget.classList.remove(this.pressedClass)
      this.quarterTarget.classList.add(this.unpressedClass)
      this.annualTarget.classList.add(this.pressedClass)
      this.greetingTarget.classList.remove(this.pressedClass)
      this.quarterSheetTarget.classList.add(this.hideClass)
    }
  }
}