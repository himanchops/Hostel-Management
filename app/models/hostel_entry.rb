class HostelEntry < ApplicationRecord
	default_scope -> { order(start_date: :desc) }

	belongs_to :user, optional: :true
	belongs_to :room, optional: :true

	has_many :rent_entries, dependent: :destroy

	validates :joining_date, presence: true
	before_save :fill_date_deposit

	def display_joining_date
		self.joining_date.to_formatted_s(:long)
	end

	def display_vacate_date
		if vacate_date.nil?
			return 'Not declared'
		else
			self.vacate_date.to_formatted_s(:long)
		end
	end

	def display_room
		if self.room_id.nil?
			return 'Nil'
		else
			self.room.name
		end
	end
	private
		def fill_date_deposit
			if !booking_date.present?
				self.booking_date = Date.current
			end
			if !deposit.present?
				self.deposit = 0
			end
		end

end
