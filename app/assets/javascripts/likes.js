$(function(){

// ---------   変数    -------------------------------
  // -------   フォローボタンの祖先要素    -------------
  var $likeBtnBox = $('.item__like_box');

// ---------  メソッド  -------------------------------
  function changeLikesNumber(addedNumber){
    var $numberBox = $('#item__like_box__btn_likes_number');
    var currentLikes = Number($numberBox.text());
    $numberBox.text(currentLikes + addedNumber);
  }

  function changeBtnIcon(icon){
    var $iconTag = $('#like_btn_icon');
    $iconTag.attr('class', '');
    $iconTag.attr('class','fa ' + icon)
  }

  // like後にボタンをlike解除ボタンに変更するメソッド
  function changeToStopLikeBtn(like){
    var $btn = $('#like_btn');
    $btn.attr('id', 'stop_like_btn');
    $btn.attr('data-id',like.id);
    changeLikesNumber(1);
    changeBtnIcon('fa-heart');
  }

  // like解除後にボタンをlikeボタンに変更するメソッド
  function changeToLikeBtn(){
    var $btn = $('#stop_like_btn');
    $btn.attr('id', 'like_btn');
    $btn.attr('data-id','');
    changeLikesNumber(-1);
    changeBtnIcon('fa-heart-o');
  }

// ---------  イベント  -------------------------------
  // ボタンをクリック、like追加して、like解除ボタンに変更するイベント
  $likeBtnBox.on('click', '#like_btn', function(){
    var $likeBtn = $('#like_btn');
    var userId   = $likeBtn.attr('data-user-id');
    var itemId   = $likeBtn.attr('data-item-id');
    $.ajax({
      type : 'POST',
      url  : '/likes',
      data : { user_id: userId, item_id: itemId }
    })
    .done(function(like){
      changeToStopLikeBtn(like);
    })
    .fail(function(){
      alert('いいね！登録に失敗しました');
    });
  });

  // ボタンをクリック、like解除して、likeボタンに変更するイベント
  $likeBtnBox.on('click', '#stop_like_btn', function(){
    var $likeBtn = $('#stop_like_btn');
    var likeId   = $likeBtn.attr('data-id');
    $.ajax({
      type : 'DELETE',
      url  : '/likes/' + likeId,
    })
    .done(function(like){
      changeToLikeBtn();
    })
    .fail(function(){
      alert('いいね！解除に失敗しました');
    });
  });

});
