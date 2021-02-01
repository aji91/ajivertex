function sideBarToggle(){
  $('#sdBrToggle').toggleClass('hide');
}

$(document).on('click', '.form-submit', function(){
	console.log('test');
  return $(this).closest('form').parsley().validate();
});

$(document).on("keyup", ".number-only", function (event) {
  this.value = this.value.replace(/[^0-9]/g,'');
});

$(document).on('keyup blur', '.char-only', function(){
  var node = $(this);
  node.val(node.val().replace(/[^a-zA-Z ]/g,'') );
});

function updateStates(){
  url = "/homes/get_states?country_id="+$("#branch_country_id").val();
  $("#branch_state_id").find('option').remove().end();
  $("#branch_state_id").append('<option value="">State</option>');
  $.ajax({
    method: 'get',
    url: url
  }).done(function(data){
    $.each(data, function(key, value){
      $("#branch_state_id").append('<option value=' + key + '>' + value + '</option>');
    });
  }).fail(function(){
    toastr.error('', 'States not updated. Please try to change the country.');
  });
}