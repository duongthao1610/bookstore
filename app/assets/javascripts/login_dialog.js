$(document).ready(function(){
  // $('#dialog_form').hide();
    $('#dialog_form').dialog({
      autoOpen: false,
      show: "slide",
      width: 800,
      height: 200,
      modal: true,
      title: "Log in",
      buttons: {
        Login: function(){
          $('.form-login').submit();
        },
        Cancel: function(){
          $('#dialog_form').dialog('close');
        }
      }
    });
    $('#login_button').click(function(){
      $('#dialog_form').dialog().dialog('open');
      console.log("aaaa")
    });
  });
