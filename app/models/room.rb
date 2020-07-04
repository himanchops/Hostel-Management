class Room < ApplicationRecord
	has_many :hostel_entries
	has_many :users, through: :hostel_entries
end
