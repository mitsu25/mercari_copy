$(function(){

  var $followBtnBox = $('.container__right_inner__user_box__follow_box')

// ---------  メソッド  -------------------------------
  function clearbtnBox(){
    $followBtnBox.empty();
  }
  // フォローした後にフォローをやめるボタンを追加するメソッド
  function changeToStopFollowBtn(follower){
    clearbtnBox();
    var btn = '<div class="follow_btn follow_btn--stop" data-followed-user-id="'+ follower.followed_user_id + '" data-user-id="' + follower.user_id + '" data-follower-id = "' + follower.id +'" id="stop_follow">フォロー中</div>';
    $followBtnBox.append(btn);
  }

  // フォローやめた後にフォローするボタンを追加するメソッド
  function changeToFollowBtn(follower){
    clearbtnBox();
    var btn = '<div class="follow_btn" data-followed-user-id="'+ follower.followed_user_id + '" data-user-id="' + follower.user_id + '" id="follow">フォローする</div>';
    $followBtnBox.append(btn);
  }

// -------------  イベント  -------------------------------
  //--------------  フォローのイベント  ------------------------
  $followBtnBox.on('click', '#follow', function(){
    var $followBtn = $('#follow');
    var userId     = $followBtn.attr('data-user-id');
    var targetId   = $followBtn.attr('data-followed-user-id');
    $.ajax({
      type : 'POST',
      url  : '/follower',
      data : { user_id: userId, followed_user_id: targetId }
    })
    .done(function(data){
      alert('フォローしました');
      changeToStopFollowBtn(data);
    })
    .fail(function(){
      alert('フォローに失敗しました');
    });
  });

  //---------    フォロー解除のイベント   --------------------
  $followBtnBox.on('click', '#stop_follow', function(){
    var $stopBtn   = $('#stop_follow')
    var followerId = $stopBtn.attr('data-follower-id');
    var userId     = $stopBtn.attr('data-user-id');
    var targetId   = $stopBtn.attr('data-followed-user-id');
    var url        = '/follower/' + followerId;
    $.ajax({
      type : 'DELETE',
      url  : url,
      data : { user_id: userId, followed_user_id: targetId }
    })
    .done(function(data){
      alert('フォローを解除しました');
      changeToFollowBtn(data);
    })
    .fail(function(){
      alert('フォロー解除に失敗しました');
    });
  });
});

