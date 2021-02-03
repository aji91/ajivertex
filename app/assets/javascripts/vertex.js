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
  url = "/homes/get_states?country_id="+$("#common-country").val();
  $("#common-state").find('option').remove().end();
  $("#common-state").append('<option value="">State</option>');
  $.ajax({
    method: 'get',
    url: url
  }).done(function(data){
    $.each(data, function(key, value){
      $("#common-state").append('<option value=' + key + '>' + value + '</option>');
    });
  }).fail(function(){
    toastr.error('', 'States not updated. Please try to change the country.');
  });
}

function updateHsn(evt) {
   url = "/homes/get_product?pid=";
  $.ajax({
    method: 'get',
    url: url
  }).done(function(data){
    console.log(data.hsn);
  }).fail(function(){
    toastr.error('', 'Product not found.');
  });
}