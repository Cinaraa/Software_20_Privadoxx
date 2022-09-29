class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :sport
      t.text :image
      t.text :description
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
