document.addEventListener("DOMContentLoaded", function() {
  const images = $('ul li');

  listenImageHover();
});

function listenImageHover() {
  $('.images-container li').hover(
    function(){ $(this).addClass('hover'); },
    function(){ $(this).removeClass('hover') }
  )
}
