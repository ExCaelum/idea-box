function deleteIdea() {
  $(document).on('click', '.deletePost', function(event){
    var postId = $(this).parent().data('postId');
    $.ajax({
      method: "DELETE",
      url: "/api/v1/ideas/" + postId,
      data: {id: postId},
      success: function(deletedPost){
        $(".post[data-post-id=" + postId + "]").remove();
      }
    });
  });
}
