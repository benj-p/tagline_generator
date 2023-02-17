import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapse"
export default class extends Controller {
  static targets = ["carret", "content"]
  
  toggle() {
    if (this.contentTarget.style.display === 'block') {
      this.contentTarget.style.display = 'none';
      this.carretTarget.classList.remove('open');
    } else {
      this.contentTarget.style.display = 'block';
      this.carretTarget.classList.add('open');
    }
  }
}
