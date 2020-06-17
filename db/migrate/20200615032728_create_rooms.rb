class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, id: :integer do |t|
      t.string      :name, null: false
      t.integer     :status_id, null: false
      t.timestamps
    end
  end
end
