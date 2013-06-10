$(document).ready(function() {
  $('#gamesubmit').on('click', function(e){
     e.preventDefault();
     $.ajax({
       url: '/game',
       method: 'post',
       data: $('form').serialize()
     }).done(function(data){
          console.log(data);
          if (data[0] === "redirect") {
            window.location.href = '/';
          } else {
            $('#answer').html(data[2]);
            $('#question').html(data[0]);
            $('input[id=card_id]').val(data[1]);
            $('input[name=answer]').val('');
        }
     });
     $('#card').addClass('flipped').delay(800);
      setTimeout(function(){
        $('#card').removeClass('flipped');
      }, 2500);
   });

  $('#exisiting').on('click', function(){
    $('#exisiting').fadeOut('fast', function(){
      $('#login_form').fadeIn('slow');
    });
  });

  var moveSignup = function(){
    $(".signin_box")
      .animate({ 'margin-top':'119px' }, {"queue": false, "duration": 800} )
      .animate({ opacity : 1 }, 800);
  };

  $(".button-wrapper").click(function(e) {
    e.preventDefault();
    $('#logo').fadeOut('slow');
    $('#quote_box').fadeOut('slow');
    $('.button-wrapper').fadeOut('slow', moveSignup);

  });

  var rotateThrough = function() {}
  var opacityOff = 0;
  function eachDiv(){
  var quoteCount = $("#quote_box li").length -1;
   $("#quote_box li:eq(" + opacityOff + ")")
      .animate({"opacity" : "1"}, 1000)
      .animate({"opacity" : "1"}, 5000)
      .animate({"opacity" : "0"}, 1000, function(){
        (opacityOff == quoteCount) ? opacityOff=0 : opacityOff++;
         eachDiv();
      });
   };
   eachDiv();
}); 
