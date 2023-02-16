# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "typed.js", to: "https://ga.jspm.io/npm:typed.js@2.0.12/lib/typed.js"
pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.turbo.min.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"
