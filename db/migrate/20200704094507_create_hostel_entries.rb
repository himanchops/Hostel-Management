class CreateHostelEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :hostel_entries do |t|
      t.date :joining_date
      t.date :vacate_date
      t.date :booking_date
      t.integer :deposit
      t.references :user, null: false, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
