import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="generate-tagline"
export default class extends Controller {
  static targets = ["form", "submit", "input", "tagline"]

  connect() {
  }

  generate(event) {
    event.preventDefault();
    this.submitTarget.classList.add('disabled');
    this.submitTarget.value = 'Generating...'; 
    this.taglineTarget.innerHTML = ''; 

    // Destroy Typed instance if exists
    this.typed && this.typed.destroy();

    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (!data.success) {
          data.tagline = "Uh oh, looks like our 🤖 is overheating a bit... try again in 30 seconds!"
        }
        this.taglineTarget.scrollIntoView({behavior: "smooth", block: "center"});
        this.typed = new Typed(this.taglineTarget, {
          strings: [data.tagline],
          autoStart: true,
          typeSpeed: 30,
          onComplete: (self) => {
            this.submitTarget.classList.remove('disabled');
            this.submitTarget.value = 'Generate';
            this.inputTarget.value = '';
            document.querySelector('.typed-cursor').style.display = 'none';
          }
        });
      });
  }
}
    