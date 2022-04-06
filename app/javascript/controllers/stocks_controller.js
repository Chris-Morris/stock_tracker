import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  static targets = ["loadingSpinner", "stocksTable"]

  static classes = ["show", "hide"]

  connect() {

  }
}