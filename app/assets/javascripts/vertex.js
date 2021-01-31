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