$(function(){

  var $largeImage   = $('.item__image_box__upper img')
  var $thumbnail    = $('.item_thumbnails')
  //クリックしたサムネイルを選択状態（白化）にし、
  //サムネイルの画像を上部のイメージボックスに
  $thumbnail.click(function(){
    var selectedClass = 'item__image_box__bottom__image--over';
    if($(this).hasClass(selectedClass) == false){
      $thumbnail.removeClass(selectedClass);
      $(this).addClass(selectedClass);
      $largeImage.attr('src',$(this).attr('src'));
    };
    return false;
  }).filter(':eq(0)').click();
});
