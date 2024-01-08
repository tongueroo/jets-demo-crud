# Pin npm packages by running bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js", preload: true
pin "@rubyonjets/ujs-compat", to: "https://ga.jspm.io/npm:@rubyonjets/ujs-compat@1.1.0/index.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
