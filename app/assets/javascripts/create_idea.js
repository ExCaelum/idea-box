function createIdea(){
  $('#submit-idea').on('click', function(){
    var title = $('#idea-title').val();
    var body = $('#idea-body').val();
    var data = {title: title, body: body};
    $.ajax({
      method: 'POST',
      url: '/api/v1/ideas',
      dataType: "JSON",
      data: data,
      success: function(idea){
        resetFields();
        insertIdea(idea);
      }
    });
  });
}

function resetFields(){
  $('#idea-title').val('');
  $('#idea-body').val('');
}

function insertIdea(idea){
  $('#ideas').prepend(buildIdea(idea));
}
