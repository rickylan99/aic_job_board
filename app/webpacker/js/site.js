// Site Wide Javascript

// Automatically Close Alerts
$( document ).on('turbolinks:load', function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 3000);
});


$(document).on('turbolinks:load', function() {

    $('form').on('click', '.remove_record', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('tr').hide();
      return event.preventDefault();
    });
  
    $('form').on('click', '.add_fields', function(event) {
      var regexp, time;
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $('.fields').append($(this).data('fields').replace(regexp, time));
      return event.preventDefault();
    });
    
});

$("input[type='file']").on("change", function () {
  fname = this.files[0].name;
  fextension = fname.substring(fname.lastIndexOf('.')+1);
  if(this.files[0].size > 5000000 || fextension != "pdf") {
    alert("Resume must be a PDF and less than 5MB");
    $(this).val('');
  }
 });