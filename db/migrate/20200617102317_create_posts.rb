class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, id: :integer do |t|
      t.string       :title, null: false
      t.text         :content, null: false
      t.integer      :prefecture_id, null: false
      t.references   :category, type: :integer, foreign_key: true
      t.references   :user, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
