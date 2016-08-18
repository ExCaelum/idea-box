function search() {
  $('#search').keyup(function(){
     var searchInput = $(this).val().toLowerCase();

     if(searchInput === ""){
       $('div.post').show();
     } else {
       $('div.post').each(function(){

        var title = $(this).find('.ideaTitle').html().toLowerCase();
        var body = $(this).find('.ideaBody').html().toLowerCase();

        var searchTitle = title.indexOf(searchInput) >= 0;
        var searchBody  = body.indexOf(searchInput) >= 0;

        (searchTitle || searchBody) ? $(this).show() : $(this).hide();
       });
     }
  });
}
