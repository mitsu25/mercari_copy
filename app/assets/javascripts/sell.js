$(function(){

  var commissionRate = 0.1;
  var commisionBox = $('#commission_box');
  var profitBox    = $('#profit_box');
  var preInput;

  function isInputInteger() {
    return Number.isInteger(Number(input))
  }

  function resetResults(){
    commisionBox.text("-")
    profitBox.text("-")
  }

  function outPutsResluts(commission,profit){
    commisionBox.text("¥" + commission);
    profitBox.text("¥" + profit);
  }

  $('#input_price').on('keyup', function(e){
    e.preventDefault();
    var input = $(this).val();

    if(input != preInput){
      resetResults();

      if(input >= 300 && isInputInteger){
        var commission = Math.round(input * commissionRate);
        var profit     = input - commission;
        outPutsResluts(commission,profit);
      }

      preInput = input;
    }

  });
});
