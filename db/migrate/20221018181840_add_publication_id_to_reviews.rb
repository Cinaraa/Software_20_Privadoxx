class AddPublicationIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :publication_id, :integer
  end
end
