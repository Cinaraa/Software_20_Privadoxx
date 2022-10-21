class RemoveStatusRentedFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :status_rented, :boolean
  end
end
