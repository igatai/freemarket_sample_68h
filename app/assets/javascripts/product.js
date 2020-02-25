$(function(){

  $('#input_price').change(function(){

    var p = $('#input_price').val();
    var int_input_price = parseInt(p);

    var commision = Math.floor(int_input_price * 0.1);
    var profit = int_input_price - commision;

    $('#commision').text(commision + "円")
    $('#profit').text(profit + "円")

  });
});
