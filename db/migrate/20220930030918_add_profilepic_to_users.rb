class AddProfilepicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profilepic, :text
  end
end
