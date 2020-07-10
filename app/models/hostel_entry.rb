class HostelEntry < ApplicationRecord
	belongs_to :user, optional: :true
	belongs_to :room, optional: :true

	validates :joining_date, presence: true

	before_save :fill_date

	def fill_date
		if !booking_date.present?
			self.booking_date = Date.current
		end
		if !deposit.present?
			self.deposit = 0
		end
	end

end
