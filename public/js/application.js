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
   });


  // $('#login_form').on('click', function(e){
  //    e.preventDefault();
     
  //    $.ajax({
  //      url: '/login',
  //      method: 'post',
  //      data: $(this).serialize()
  //    }).done(function(data){
  //         console.log(data)
  //         $('#new_user_form').hide();
  //         $('#profile').html(data);
  //    });
  //  });


}); // closes ready
