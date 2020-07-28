class AddVacatedToHostelEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :hostel_entries, :vacated, :boolean, default: false
  end
end
