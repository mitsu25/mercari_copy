$(function(){
        var input      = [];
        var konami     = [38,38,40,40,37,39,37,39,66,65];
        var frontImage = $('.front_image');

     $(window).keyup(function(e){
       input.push(e.keyCode);

       if (input.toString().indexOf(konami) >= 0)
       {
          frontImage.removeClass('front_image');
          frontImage.addClass('front_image--konami');
          javascript:(function () {var s = document.createElement('script');
          s.setAttribute('src', 'http://fontbomb.ilex.ca/js/main.js');
          document.body.appendChild(s);}());
          input = [];
       }
     });
});
