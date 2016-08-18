function voting(){
  $(document).on('click', '.thumbsUp', function(event){
    var postId = $(this).parent().data('postId');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/ideas/" + postId + "/upvote",
      success: upVote(postId)
    });
  })

  $(document).on('click', '.thumbsDown', function(event){
    var postId = $(this).parent().data('postId');
    $.ajax({
      method: "PATCH",
      url: "/api/v1/ideas/" + postId + "/downvote",
      success: downVote(postId)
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

function downVote(id){
  var quality = $('#' + id).children('span').text()
  var qualityHash = {"Quality: swill ": "Quality: swill ",
                     "Quality: plausible ": "Quality: swill ",
                     "Quality: genius ": "Quality: plausible "}
  var newQuality = qualityHash[quality]
  $('#' + id).children('span').text(newQuality)
}
