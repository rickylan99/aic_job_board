// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "popper.js"
import "bootstrap"

// CSS
import '../stylesheets/site.scss';

// JS
import('../js/site')

// Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)


// Automatically Close Alerts
$( document ).on('turbolinks:load', function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 3000);
});

