class CreateBookCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :book_category_relations do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end
  end
end
