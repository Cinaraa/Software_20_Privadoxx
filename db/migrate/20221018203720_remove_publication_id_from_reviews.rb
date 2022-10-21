class RemovePublicationIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :publication_id, :integer
  end
end
