function voting(){
  $(document).on('click', '.thumbsUp', function(event){
    var postId = $(this).parent().data('postId');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/ideas/" + postId + "/upvote",
      success: upVote(postId)
    });
  })
}

function upVote(id){
  var quality = $('#' + id).children('span').text()
  var qualityHash = {"Quality: swill ": "Quality: plausible ",
                     "Quality: plausible ": "Quality: genius ",
                     "Quality: genius ": "Quality: genius "}
  var newQuality = qualityHash[quality]
  $('#' + id).children('span').text(newQuality)
}
