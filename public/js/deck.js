// $(document).ready(function(){
//   $('#create-deck-form').hide();
//   $('#add-ques-ans').hide();
  
//   $('#create-button').on('click', function(e){
//       e.preventDefault();
//       $('#create-button').hide();
//       $('#create-deck-form').show();
//       $('#create-deck-form').on('click', function(){
//         $.ajax({
//           type: 'post',
//           url: '/deck/create',
//           data: $(this).serialize()
//       }).done()
//         $('#add-ques-ans').show();
//       console.log("getting somewhere");
    



//     })  
      
    
//   });
// });

$(document).ready(function(){
  var questionsTemplate = $('#questions').html();
  $('.add').on('click', function(e) { 
    e.preventDefault(); 
    $('#questions').append(questionsTemplate); 
  });
});
