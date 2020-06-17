$(function(){
  
  function buildHTML(chat){
    if (chat.image) {
      var html =
       `
        <div class="upper-chat">
          <div class="upper-chat__user-name">
            ${chat.user_nickname}
            <div class="upper-chat__date">
              ${chat.created_at}
            </div>
          </div>
          <div class="lower-chat">
            <p class="lower-chat__content">
              ${chat.content}
            </p>
            <img src=${chat.image} class="lower-chat__image">
          </div>
        </div>`
      return html;
    } else {
      var html =
       `
        <div class="upper-chat">
          <div class="upper-chat__user-name">
            ${chat.user_nickname}
            <div class="upper-chat__date">
              ${chat.created_at}
            </div>
          </div>
          <div class="lower-chat">
            <p class="lower-chat__content">
              ${chat.content}
            </p>
          </div>
        </div>`
      return html;
    };
  }

  $('#new_chat').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat').append(html);
       $('form')[0].reset();
    })
  });
});