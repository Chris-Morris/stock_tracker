import { Controller } from "@hotwired/stimulus"

let sheet = 'income'

export default class extends Controller {
  static targets = ["quarter", "annual", "quarterIncomeStatement", "annualIncomeStatement", "quarterBalanceSheet", "annualBalanceSheet", "quarterCashFlow", "annualCashFlow"]

  static classes = ["unpressed", "pressed", "hide"]

  connect() {

  }

  income(event) {
    event.preventDefault()
    sheet = 'income'

    if (this.quarterIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.quarterIncomeStatementTarget.classList.remove(this.hideClass)
    }

    if (!this.annualIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.annualIncomeStatementTarget.classList.add(this.hideClass)
    }

    if (!this.quarterBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.quarterBalanceSheetTarget.classList.add(this.hideClass)
    }

    if (!this.annualBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.annualBalanceSheetTarget.classList.add(this.hideClass)
    }

    if (!this.quarterCashFlowTarget.classList.contains(this.hideClass)) {
      this.quarterCashFlowTarget.classList.add(this.hideClass)
    }

    if (!this.annualCashFlowTarget.classList.contains(this.hideClass)) {
      this.annualCashFlowTarget.classList.add(this.hideClass)
    }
  }

  balance(event) {
    event.preventDefault()
    sheet = 'balance'

    this.quarterBalanceSheetTarget.classList.remove(this.hideClass)
    if (this.quarterBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.quarterBalanceSheetTarget.classList.remove(this.hideClass)
    }

    if (!this.annualBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.annualBalanceSheetTarget.classList.add(this.hideClass)
    }

    if (!this.quarterIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.quarterIncomeStatementTarget.classList.add(this.hideClass)
    }

    if (!this.annualIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.annualIncomeStatementTarget.classList.add(this.hideClass)
    }

    if (!this.quarterCashFlowTarget.classList.contains(this.hideClass)) {
      this.quarterCashFlowTarget.classList.add(this.hideClass)
    }

    if (!this.annualCashFlowTarget.classList.contains(this.hideClass)) {
      this.annualCashFlowTarget.classList.add(this.hideClass)
    }
  }

  cash(event) {
    event.preventDefault()
    sheet = 'cash'

    if (this.quarterCashFlowTarget.classList.contains(this.hideClass)) {
      this.quarterCashFlowTarget.classList.remove(this.hideClass)
    }

    if (!this.annualCashFlowTarget.classList.contains(this.hideClass)) {
      this.annualCashFlowTarget.classList.add(this.hideClass)
    }

    if (!this.quarterBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.quarterBalanceSheetTarget.classList.add(this.hideClass)
    }

    if (!this.annualBalanceSheetTarget.classList.contains(this.hideClass)) {
      this.annualBalanceSheetTarget.classList.add(this.hideClass)
    }

    if (!this.quarterIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.quarterIncomeStatementTarget.classList.add(this.hideClass)
    }

    if (!this.annualIncomeStatementTarget.classList.contains(this.hideClass)) {
      this.annualIncomeStatementTarget.classList.add(this.hideClass)
    }
  }

  quarter(event) {
    event.preventDefault()

    if (sheet == 'income') {
      if (this.quarterIncomeStatementTarget.classList.contains(this.hideClass)) {
        this.quarterIncomeStatementTarget.classList.remove(this.hideClass)
      }

      if (!this.annualIncomeStatementTarget.classList.contains(this.hideClass)) {
        this.annualIncomeStatementTarget.classList.add(this.hideClass)
      }
    }

    if (sheet == 'balance') {
      if (this.quarterBalanceSheetTarget.classList.contains(this.hideClass)) {
        this.quarterBalanceSheetTarget.classList.remove(this.hideClass)
      }

      if (!this.annualBalanceSheetTarget.classList.contains(this.hideClass)) {
        this.annualBalanceSheetTarget.classList.add(this.hideClass)
      }
    }

    if (sheet == 'cash') {
      if (this.quarterCashFlowTarget.classList.contains(this.hideClass)) {
        this.quarterCashFlowTarget.classList.remove(this.hideClass)
      }

      if (!this.annualCashFlowTarget.classList.contains(this.hideClass)) {
        this.annualCashFlowTarget.classList.add(this.hideClass)
      }
    }

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

    if (sheet == 'income') {
      if (this.annualIncomeStatementTarget.classList.contains(this.hideClass)) {
        this.annualIncomeStatementTarget.classList.remove(this.hideClass)
      }

      if (!this.quarterIncomeStatementTarget.classList.contains(this.hideClass)) {
        this.quarterIncomeStatementTarget.classList.add(this.hideClass)
      }
    }

    if (sheet == 'balance') {
      if (this.annualBalanceSheetTarget.classList.contains(this.hideClass)) {
        this.annualBalanceSheetTarget.classList.remove(this.hideClass)
      }

      if (!this.quarterBalanceSheetTarget.classList.contains(this.hideClass)) {
        this.quarterBalanceSheetTarget.classList.add(this.hideClass)
      }
    }

    if (sheet == 'cash') {
      if (this.annualCashFlowTarget.classList.contains(this.hideClass)) {
        this.annualCashFlowTarget.classList.remove(this.hideClass)
      }

      if (!this.quarterCashFlowTarget.classList.contains(this.hideClass)) {
        this.quarterCashFlowTarget.classList.add(this.hideClass)
      }
    }

    if (!this.annualTarget.classList.contains(this.pressedClass)) {
      this.quarterTarget.classList.remove(this.pressedClass)
      this.quarterTarget.classList.add(this.unpressedClass)
      this.annualTarget.classList.add(this.pressedClass)
      this.greetingTarget.classList.remove(this.pressedClass)
      this.quarterBalanceSheetTarget.classList.add(this.hideClass)
    }
  }
}