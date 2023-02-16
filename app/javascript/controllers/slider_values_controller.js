import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider-values"
export default class extends Controller {
  static targets = ['slider', 'displayValue']
  
  connect() {
    this.update();
  }

  update() {
    this.displayValueTarget.innerText = this.sliderTarget.value;
  }
}
