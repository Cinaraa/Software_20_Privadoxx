class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
