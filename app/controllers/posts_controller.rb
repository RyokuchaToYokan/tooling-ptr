class PostsController < ApplicationController
# 削除ではgem data-confirm-modalを使用すること

  def index
    @sidecontents = ["新着情報", "お悩み相談室", "個人ブログ", "グループ", "バイク別", "おすすめルート", "おすすめのスポット", "おすすめのお店", "おすすめの施設", "交通情報", "おすすめのウェア", "おすすめのアイテム"]
  end
  
end