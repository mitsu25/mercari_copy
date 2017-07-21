$(function(){
  $(".item__image_box__upper img").bind("load",function(){
    var ImgHeight = $(this).height();
    $('.item__image_box__upper').css('height',ImgHeight);
  });

  $('.item_images img').click(function(){
    var selectedClass = 'item__image_box__bottom__image--over';
    if($(this).hasClass(selectedClass) == false){
      $('.item_images img').removeClass(selectedClass);
      $(this).addClass(selectedClass);
      $('.item__image_box__upper img').attr('src',$(this).attr('src'));
    };
    return false;
  }).filter(':eq(0)').click();
});
