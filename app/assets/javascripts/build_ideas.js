
function buildIdeas(){
  $.ajax({
    method: "GET",
    url: "/api/v1/ideas",
    dataType: "JSON",
    success: function(ideas){
      ideas.sort(function(x,y){
        return (y.created_at < x.created_at) ? -1 : ((y.created_at > x.created_at) ? 1 : 0)
      })
      $(ideas).each(function(index, idea){
        $('#ideas').append(buildIdea(idea))
      })
    }
  })
}

function buildIdea(idea) {
  var formatBody = shorten(idea.body)
  return (
    "<div class='post col-md-12' data-post-id='"+ idea.id + "' data-post-quality='" + idea.quality + "'>" + "<div class='ideaTitle'><h2> " + idea.title + "</h2></div>" + "<div class='ideaBody'>-     " + formatBody + "</div>" + "<br><span class='ideaQuality'>Quality: " + idea.quality + " </span><br>" +
    "<input type='button' class='thumbsUp btn-success glyphicon' value='Thumbs Up'></input>" + "<input type='button' class='thumbsDown btn-warning glyphicon' value='Thumbs Down'></input><input type='button' class='deletePost btn-danger glyphicon' value='Delete'></input><br><br><hr><br></div>"
  )
}

function shorten(body){
  if (body.length <= 100){
    return body
  } else if (body.charAt(100) === ' '){
    return body.substring(0, [100]) + '...'
  } else {
    var short = body.substring(0, [100])
		var bodyArray = short.split(" ")
		bodyArray.pop()
		return bodyArray.join(" ") + "..."
  }
}
