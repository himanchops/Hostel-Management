class HostelEntry < ApplicationRecord
	default_scope -> { order(start_date: :desc) }

	belongs_to :user, optional: :true
	belongs_to :room, optional: :true

	has_many :rent_entries, dependent: :destroy

	validates :joining_date, presence: true

	before_create :fill_date_deposit_due_rent
	before_save :set_vacated

	def display_room
		if self.room_id.nil?
			return 'Nil'
		else
			self.room.name
		end
	end

	private
		def fill_date_deposit_due_rent
			unless booking_date.present?
				self.booking_date = Date.current
			end
			unless deposit.present?
				self.deposit = 0
			end
			unless total_rent_due.present?
				self.total_rent_due = 0
			end
		end

		def set_vacated
			unless self.rent_entries.present?
				self.vacated = true
			end
		end
end
