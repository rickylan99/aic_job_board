// Site Wide Javascript

// Automatically Close Alerts
$( document ).on('turbolinks:load', function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 5000);
});