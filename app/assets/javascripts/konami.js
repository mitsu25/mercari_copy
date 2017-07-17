$(function(){

// ------------   変数定義  --------------------------
  var input      = [];
  var konami     = [38,38,40,40,37,39,37,39,66,65];
  var $frontImage = $('#front_image');
  var $gradius    = $('#gradius');

// ------------   メソッド  --------------------------
  function buildLaser(leftPosition,topPosition){
    var laser = '<span class="laser" poition="relative" left="'+leftPosition+'px" top=' + topPosition+'px">******</p>';
    return laser;
  }

// ------------   イベント  --------------------------
  // キーを押すとイベント発火
  $(window).keyup(function(e){
  input.push(e.keyCode);

    // キーコードが上記定義のコードリストと一致するかを判定
    if (input.toString().indexOf(konami) >= 0)
      {
        $('.front_image_item').remove();
        $gradius.show();
        $frontImage.removeClass('front_image');
        $frontImage.addClass('front_image--konami');
        input = [];
      }
    });

    // グラディウス操作のイベントを読み込み
    // 指定のキーを押すたびにpositionの値を増減させる
    var gradiusSpeed   = 18
    var mevePerKeyDown = 15
    $('html').keydown(function(e){
      switch(e.which){
        case 83: // Key[s]
        $gradius.animate({left: '+='+ mevePerKeyDown +'px'},gradiusSpeed);
        break;

        case 65: // Key[a]
        $gradius.animate({left: '-='+ mevePerKeyDown +'px'},gradiusSpeed);
        break;

        case 87: // Key[w]
        $gradius.animate({top: '-='+ mevePerKeyDown +'px'},gradiusSpeed);
        break;

        case 90: // Key[z]
        $gradius.animate({top: '+='+ mevePerKeyDown +'px'},gradiusSpeed);
        break;
      }
    });

    // レーザーのイベント（途中）
    $('html').keydown(function(e){
      switch(e.which){
        case 76: // Key[l]
        var leftPosition = $gradius.offset().left;
        var topPosition = $gradius.offset().top;
        var laser = buildLaser(leftPosition,topPosition);
        $frontImage.append(laser);
        $gradius.append(laser);
        break;
      }
      var $laser = $('.laser').animate({
        left: "1000px"
      }, 1000, "linear");
    });
});
