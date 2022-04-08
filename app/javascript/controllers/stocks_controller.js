import { Controller } from '@hotwired/stimulus';
import { get } from '@rails/request.js';

export default class extends Controller {
  static values = { url: String }

  async runScan(e) {
    e.preventDefault()
    const loader = document.getElementById('loader');
    loader.style.display = 'block';

    const stocksContainer = document.getElementById('stocksContainer');
    stocksContainer.style.display = 'none';

    const scanSelect = document.getElementById('scan')
    const scanId = scanSelect.value;

    const response = await get(this.urlValue + `?scan=${scanId}`, { responseKind: "html" });

    if (response.ok) {
      loader.style.display = 'none';
      stocksContainer.style.display = 'block';
    } else {
      console.log("HTML not fetched ok");
    };
  };
};