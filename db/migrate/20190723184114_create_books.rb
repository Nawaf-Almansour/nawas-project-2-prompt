class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.date :book_year_published
      t.string :image
      t.string :description
      t.decimal :price, default: "0.0"

      t.timestamps
    end
  end
end
