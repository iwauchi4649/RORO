$(function(){
  function bodyresize(){
      var value = $(window).width();
      //$('#debug').text(value);
      if(value > 1023||value <= 639){
          $('body').css("zoom",1);
      }else if(value <= 1023&&value > 639){
          w = value / 1023;
          $('body').css("zoom",w);
      }
  }

  $(window).load(function() {
  bodyresize()
  });

  $(window).resize(function() {
  bodyresize()
  });
});