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

}); // closes ready
