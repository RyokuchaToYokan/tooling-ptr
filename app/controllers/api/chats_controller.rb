class Api::ChatsController < ApplicationController
  def index
    # ルーティングでの設定によりparamsの中にroom_idというキーでグループのidが入るので、これを元にDBからグループを取得する
    room = Room.find(params[:room_id])
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_chat_id = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_chat_idよりも新しい(大きい)メッセージ達のみを取得
    @chats = room.chats.includes(:user).where("id > ?", last_chat_id)
  end
end