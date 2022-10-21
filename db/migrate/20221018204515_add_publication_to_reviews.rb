class AddPublicationToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :publication, null: false, foreign_key: true
  end
end
