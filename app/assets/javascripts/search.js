$(function() {
  $('#search_book').autocomplete({
    source: function(request, response) {
      $.ajax( {
        url: "/books",
        dataType: "json",
        data: {
          term: request.term,
          q: {category_name_eq: $('#ctg-select').val()}
        },
        success: function( data ) {
          response( data );
        }
      });
    }
  })
})

