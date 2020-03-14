window.onload = function(){
  $(document).on('click', '.header__trigger__bottun', function(){
    $('.header__trigger__bottun').toggleClass('act');
    $('.menu').toggleClass('act');
  });
};