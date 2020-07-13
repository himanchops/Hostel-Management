class HostelEntry < ApplicationRecord
	belongs_to :user, optional: :true
	belongs_to :room, optional: :true

	validates :joining_date, presence: true

	before_save :fill_date_deposit

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
