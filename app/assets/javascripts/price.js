$(function(){
  $('#item_price').keyup( function(e) {
    var item_price_value = $("#item_price").val();

    $('#item_price').attr({
      'value': item_price_value
    });
    item_price = parseInt(item_price_value);
    if (item_price >= 300 && item_price <= 9999999){
      var handling_charge = Math.floor(item_price * 0.1);
      $("#handling_charge.l-right").html("¥" + handling_charge);
      var profit_fee =item_price - handling_charge;
      $("#profitFee.l-right").html("¥" + profit_fee);
    } else {
      $("#handling_charge.l-right").html("-");
      $("#profitFee.l-right").html("-");
    }
    e.preventDefault();
  });
});
