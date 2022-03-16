import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quarter", "annual", "quarterIncomeStatement", "annualIncomeStatement", "quarterBalanceSheet", "annualBalanceSheet", "quarterCashFlow", "annualCashFlow"]

  static classes = ["unpressed", "pressed", "hide"]

  connect() {

  }

  quarter(event) {
    event.preventDefault()

    this.quarterBalanceSheetTarget.classList.remove(this.hideClass)
    this.annualBalanceSheetTarget.classList.add(this.hideClass)
    if (!this.quarterTarget.classList.contains(this.pressedClass)) {
      this.annualTarget.classList.remove(this.pressedClass)
      this.annualTarget.classList.add(this.unpressedClass)
      this.quarterTarget.classList.add(this.pressedClass)
      this.greetingTarget.classList.add(this.pressedClass)
      this.annualBalanceSheetTarget.classList.add(this.hideClass)
    }
  }

  annual(event) {
    event.preventDefault()

    this.annualBalanceSheetTarget.classList.remove(this.hideClass)
    this.quarterBalanceSheetTarget.classList.add(this.hideClass)
    if (!this.annualTarget.classList.contains(this.pressedClass)) {
      this.quarterTarget.classList.remove(this.pressedClass)
      this.quarterTarget.classList.add(this.unpressedClass)
      this.annualTarget.classList.add(this.pressedClass)
      this.greetingTarget.classList.remove(this.pressedClass)
      this.quarterBalanceSheetTarget.classList.add(this.hideClass)
    }
  }
}