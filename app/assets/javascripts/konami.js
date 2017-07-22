$(function(){

// ------------   変数定義  --------------------------
  var input      = [];
  var konami     = [38,38,40,40,37,39,37,39,66,65];
  var $frontImage = $('#front_image');
  var $gradius    = $('#gradius');

// ------------   メソッド  --------------------------
  function buildLaser(leftPosition,topPosition){
    var laser = '<div class="laser" style="left:'+leftPosition+'px; top:' + topPosition+'px;">******</div>';
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
    var topMax         = 12.5
    var bottomMax      = 402.5
    var rightMax       = 1080
    var leftMax        = -90
    $('html').keydown(function(e){
      switch(e.which){
        case 83: // Key[s]
        var position = $gradius.position();
        if (position.left < rightMax){
          $gradius.animate({left: '+='+ mevePerKeyDown +'px'},gradiusSpeed);
        }
        break;

        case 65: // Key[a]
        var position = $gradius.position();
        if (position.left > leftMax){
          $gradius.animate({left: '-='+ mevePerKeyDown +'px'},gradiusSpeed);
        }
        break;

        case 87: // Key[w]
        var position = $gradius.position();
        if (position.top > topMax){
          $gradius.animate({top: '-='+ mevePerKeyDown +'px'},gradiusSpeed);
        }
        break;

        case 90: // Key[z]
        var position = $gradius.position();
        if (position.top < bottomMax){
          $gradius.animate({top: '+='+ mevePerKeyDown +'px'},gradiusSpeed);
        }
        break;
      }
    });

    // レーザーのイベント（途中）
    $('html').keydown(function(e){
      switch(e.which){
        case 76: // Key[l]
        var leftPosition = $gradius.position().left;
        var topPosition = $gradius.position().top;
        var laser = buildLaser(leftPosition,topPosition);
        $frontImage.append(laser);
        break;
      }
      // var $laser = $('.laser').animate({
      //   left: "1000px"
      // }, 1000, "linear");
    });
});
