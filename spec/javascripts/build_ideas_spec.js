//= require build_ideas


describe('buildIdea', function () {
  it('it builds the html format for an idea', function () {
    var idea = buildIdea({
      body: "Now it works!",
      created_at: "2016-08-18T04:27:39.338Z",
      id: 54,
      quality: "genius",
      title: " Will it work?",
      updated_at: "2016-08-18T08:05:36.998Z"
    })
    assert.equal(idea, '<div class=\'post col-md-12\' id=\'54\' data-post-id=\'54\' data-post-quality=\'genius\'><div class=\'ideaTitle\'><h2 class=\'title\' data-id=\'54\' id=\'title-54\'>  Will it work?</h2></div><div class=\'ideaBody\' data-id=\'54\' id=\'body-54\'>Now it works!</div><br><span class=\'ideaQuality\'>Quality: genius </span><br><input type=\'button\' class=\'thumbsUp btn-success glyphicon\' value=\'Thumbs Up\'></input><input type=\'button\' class=\'thumbsDown btn-warning glyphicon\' value=\'Thumbs Down\'></input><input type=\'button\' class=\'deletePost btn-danger glyphicon\' value=\'Delete\'></input><br><br><hr><br></div>')
  });
});

describe('shorten', function(){
  it('it shortens the body to the nearest word under 100 characters', function(){
    var goodBody = shorten("Bitters microdosing lomo viral seitan. Ugh cardigan lo-fi cliche. Waistcoat flexitarian truffaut cronut. Pickled cronut banjo craft beer. Typewriter ugh knausgaard semiotics tumblr.")
    var goal = "Bitters microdosing lomo viral seitan. Ugh cardigan lo-fi cliche. Waistcoat flexitarian truffaut..."
    assert.equal(goal, goodBody)
  })
})
