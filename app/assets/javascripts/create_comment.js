$(function(){
  $('#new_comment input[type="submit"]').on('click', function(e){
    e.preventDefault();
    var comment_content = $('#comment_content').val();
    var cosmetic_id = $('#comment_cosmetic_id').val();
    data = {"comment": {"content": comment_content, "cosmetic_id": cosmetic_id}}
    $.ajax({
      method: 'POST',
      url: '/cosmetics/' + cosmetic_id + '/comments',
      type: 'JSON',
      data: data
    }).success(function(data){
      $('.all-comment').prepend(data.content);
      $('#comment_content').val("");
    }).error(function(){
      alert('An error occurred...');
    });
  });
});
