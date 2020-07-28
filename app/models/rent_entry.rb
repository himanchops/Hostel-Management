class RentEntry < ApplicationRecord
  belongs_to :hostel_entry
  default_scope -> { order(to_date: :desc) }

  validates :from_date, presence: true
  validates :rent, presence: true, numericality: {only_integer: true}
  
  before_save :fill_details

  def payment
  	return if self.amount_paid.nil?
  	s1 = "Paid: #{self.amount_paid}, Bal: #{self.rent-self.amount_paid}"
  	if payment_date.nil?
      return s1
    else
  		return s1 + " (on #{self.payment_date.to_formatted_s(:short)})"
  	end
  end

  def display_date (date)
  	if date.nil?
  		'Nil'
  	else
  		date.to_formatted_s(:short)
  	end
  end

  private
    def fill_details
      unless amount_paid.present?
        self.amount_paid = 0
      end
    end
end
