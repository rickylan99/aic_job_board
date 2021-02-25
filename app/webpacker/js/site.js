// Site Wide Javascript

// Automatically Close Alerts
$( document ).on('turbolinks:load', function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 3000);
});

document.addEventListener("turbolinks:load", function() {
    console.log('Test Log');
});

// ----------------------------
// Validate Password Functions
var typingTimer;             
var doneTypingInterval = 250; 
// Countdown when keyup begins
$('#password-confirmation').keyup(function(){
    clearTimeout(typingTimer);
    if ($('#password-confirmation').val()) {
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    }
});
// When user finishes typing run validation
function doneTyping () {
    
    const submit_button = document.getElementById('submit-button');
    const pass1 = document.getElementById('password');
    const pass2 = document.getElementById('password-confirmation');
    const message = document.getElementById('error-new');
    var startColor = "#ffffff";
    var textColor = "#ff6666";
    var badColor = "#ffa8a8";

    if(pass1.value.length > 3 && pass2.value.length > 3)
    {
        if(pass1.value == pass2.value){
            pass1.style.backgroundColor = startColor;
            pass2.style.backgroundColor = startColor;
            submit_button.disabled = false;
            message.innerHTML = "";
        }
        
        
        if(pass1.value != pass2.value)
        {
            pass2.style.backgroundColor = badColor;
            message.style.color = textColor;
            message.innerHTML = "Passwords do not match";
            submit_button.disabled = true;
        }
    }
    else
    {
        pass1.style.backgroundColor = badColor;
        pass2.style.backgroundColor = badColor;
        message.style.color = textColor;
        message.innerHTML = "Passwords must be at least 4 digits";
        submit_button.disabled = true;
    }
}
// ----------------------------