class PostsController < ApplicationController
# 削除ではgem data-confirm-modalを使用すること

  def index
    @usercontents = ["マイメニュー", "マイグループ", "投稿"]
    @sidecontents = ["新着情報", "お悩み相談室(ChatSpace風)", "グループ一覧", "バイク板", "おすすめルート", "おすすめスポット", "おすすめのお店", "おすすめの施設", "おすすめのウェア", "おすすめのアイテム", "交通情報の共有", "お問い合わせ"]
  end
  
end