$(function(){
  function buildHTML(comment){
    let html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments__show').append(html);
      $('.Post-page').animate({ scrollTop: $('.Post-page')[0].scrollHeight});
      $('.comment-text').val('');
      $('.comment-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
      $('.comment-submit').prop('disabled', false);
    })
  })
});
