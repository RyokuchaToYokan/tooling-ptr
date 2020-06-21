class CreatePostCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_categories, id: :integer do |t|
      t.references :post, type: :integer, foreign_key: true
      t.references :category, type: :integer, foreign_key: true      
      t.timestamps
    end
  end
end
