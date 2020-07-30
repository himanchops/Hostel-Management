class AddTotalRentDueAndBalance < ActiveRecord::Migration[6.0]
  def change
  	add_column :hostel_entries, :total_rent_due, :integer
  	add_column :rent_entries, :balance, :integer
  end
end