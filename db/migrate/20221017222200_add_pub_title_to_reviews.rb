class AddPubTitleToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :pub_title, :string
  end
end
