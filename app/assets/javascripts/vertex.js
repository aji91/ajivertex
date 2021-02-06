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
  var pid = $(evt).val();
  url = "/homes/get_product?pid="+pid;
  $.ajax({
    method: 'get',
    url: url
  }).done(function(data){
    $(evt).parent().parent().next().children().children().val(data.hsn);
    $(evt).parent().parent().next().next().next().children().children().val(data.price);
  }).fail(function(){
    toastr.error('', 'Product not found.');
  });
}

function findSgst(evt){
  var tid = $(evt).val();
  url = "/homes/find_tax?tid="+tid;
  $.ajax({
    method: 'get',
    url: url
  }).done(function(data){
    $(evt).parent().parent().next().children().children().val(data.sgst);
    calculate_row();
  }).fail(function(){
    toastr.error('', 'Tax not found.');
  });
}

$(document).on('blur', '.quantity_class', function(){
  calculate_row();
});

$(document).on('blur', '.rate_class', function(){
  calculate_row();
});

function calculate_row(){
  var subtotal = 0;
  var cgst = 0;
  var sgst = 0;
  $('.total_cal_tr').each(function(ele){
    var quan = $(this).find('.quantity_class').val();
    var rate = $(this).find('.rate_class').val();
    var cgst_v = $(this).find('.cgst_class').val();
    var cg_val;
    var total;
    if (quan != '' && rate != '' && cgst_v != ''){
      quan = parseFloat(quan);
      rate = parseFloat(rate);
      cgst_split = cgst_v.split('-');
      total = quan*rate;
      $(this).find('.amount_class').val(total);
      subtotal = (subtotal + total);
      $('#estimate_sub_total').val(subtotal);
      cg_val = total * parseFloat(cgst_split[1]) / 100;
      cgst = cgst + cg_val;
      if (cgst_split[0] != 'IGST'){
        sgst = sgst + cg_val;
      }

    }
  });
  $('#estimate_cgst').val(cgst);
  $('#estimate_sgst').val(sgst);
  $('#estimate_total').val(subtotal + cgst + sgst);
}

$(document).on('click', '.remove-model', function(){
  $(this).parent().parent().parent().parent().find('.destroy_model_c').val('true');
  $(this).closest('.total_cal_tr').remove();
  calculate_row();
});