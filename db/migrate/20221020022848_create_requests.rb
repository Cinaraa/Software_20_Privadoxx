class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :body
      t.date :start
      t.date :finish
      t.references :publication, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :owner
      t.boolean :status_rented

      t.timestamps
    end
  end
end
