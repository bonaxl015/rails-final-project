if ($('#caption').val() == '')
  $('#create-post-button').attr('disabled', true);

$('#caption').keyup(function(){
  if ($('#caption').val() != '')
    $('#create-post-button').prop('disabled', false);
  else
    $('#create-post-button').prop('disabled', true);
});