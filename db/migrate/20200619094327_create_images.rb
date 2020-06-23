class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images, id: :integer do |t|
      t.string      :picture
      t.integer     :message_id, foreign_key: true
      t.references  :user, type: :integer, foreign_key: true
      t.references  :post, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
