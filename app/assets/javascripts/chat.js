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
          <div class="lower-chat" data-chat-id=${chat.id}>
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
          <div class="lower-chat" data-chat-id=${chat.id}>
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
      $('.chats').animate({ scrollTop: $('.chats')[0].scrollHeight});
      $('form')[0].reset();
      $('.form__submit').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });

  var reloadChats = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    var last_chat_id = $('.lower-chat:last').data("chat-id");
    $.ajax({
      //ルーティングで設定した通り/rooms/id番号/api/chatsとなるよう文字列を書く
      url: "api/chats",
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_chat_id}
    })
    .done(function(chats) {
      if (chats.length !==0) {
        //追加するHTMLの入れ物を作る
        var insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(chats, function(i, chat) {
          insertHTML += buildHTML(chat)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
        $('.chat').append(insertHTML);
        $('.chats').animate({ scrollTop: $('.chats')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('error');
    });
  };
  if (document.location.href.match(/rooms\/\d+\/chats/)) {
    setInterval(reloadChats, 7000);
  }
});