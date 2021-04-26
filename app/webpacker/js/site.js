// Site Wide Javascript

// Automatically Close Alerts
$( document ).ready(function() {
    // show the alert
    setTimeout(function() {
        $(".alert").alert('close');
    }, 3000);
});


$(document).ready(function() {

    $('form').on('click', '.remove_record', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('div').hide();
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

$("#file_upload_button").change(function () {
  fname = this.files[0].name;
  fextension = fname.substring(fname.lastIndexOf('.')+1);
  if(this.files[0].size > 5000000 || fextension != "pdf") {
    alert("Resume must be a PDF and less than 5MB");
    $(this).val('');
  }
  else{
    $("#resume_upload_submit").show();
  }
  
 });

 $(document).ready(function() {

  $('#first_name_edit_pencil').click(function() {
    $('#first_name_edit_submit').show();
    $( "#first_name_edit_box" ).prop( "disabled", false );
  });

  $('#last_name_edit_pencil').click(function() {
    $('#last_name_edit_submit').show();
    $( "#last_name_edit_box" ).prop( "disabled", false );
  });

  $('#email_edit_pencil').click(function() {
    $('#email_edit_submit').show();
    $( "#email_edit_box" ).prop( "disabled", false );
  });

  $('#password_edit_pencil').click(function() {
    $('#password_edit_submit').show();
    $('#edit_password_confirmation_box').show()
    $('#password_confirmation_label').show()
    $( "#edit_password_box" ).prop( "disabled", false );
  });

  $('#password_edit_submit').on('click', function () {
    if ($('#edit_password_box').val() != $('#edit_password_confirmation_box').val()) {
      $('#edit_password_box').val('');
      $('#edit_password_confirmation_box').val('');
      alert('Password and Confirmation must match!');
    }
  });

  $("#classification_edit").on('change', function() {
    $('#classification_edit_submit').show();
  });

  $('#major_edit_pencil').click(function() {
    $('#major_edit_submit').show();
    $( "#major_edit_box" ).prop( "disabled", false );
  });

  $("#pref_edit").on('change', function() {
    $('#pref_edit_submit').show();
  });

  $("#pref_edit").on('change', function() {
    $('#pref_edit_submit').show();
  });


});

$(document).ready(function() {
  if ($(".progress").length > 0){
    var total_time = parseInt($("#total-time").text());

    var i = 0;

    var counterBack = setInterval(function(){
      i++;
      if (i <= total_time){
        $('.progress-bar').css('width', Math.ceil((i / total_time)*100) + '%');
      } else {
        $('#download-export-btn').show();
        clearInterval(counterBack);
      }
      
    }, 1500);

  }
});
    

