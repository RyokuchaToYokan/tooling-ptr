class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats, id: :integer do |t|
      t.string      :content
      t.references  :room, type: :integer, foreign_key: true
      t.references  :user, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
