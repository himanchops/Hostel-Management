class CreateRentEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :rent_entries do |t|
      t.date :from_date
      t.date :to_date
      t.integer :rent
      t.date :payment_date
      t.integer :amount_paid
      t.references :hostel_entry, null: false, foreign_key: true
      t.timestamps
    end
  end
end
