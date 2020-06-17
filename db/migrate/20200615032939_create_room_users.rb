class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users, id: :integer do |t|
      t.references :room, type: :integer, foreign_key: true
      t.references :user, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
