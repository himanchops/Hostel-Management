class RentEntry < ApplicationRecord
  belongs_to :hostel_entry
  default_scope -> { order(from_date: :desc) }

  def payment
  	if self.amount_paid == self.rent
  		s1 = "Paid: #{self.rent}"
  		if !payment_date.nil?
  			return s1 + " (on #{self.payment_date.to_formatted_s(:short)})"
  		end
  	else
  		s1 = "Paid: #{self.amount_paid}, Bal: #{self.rent-self.amount_paid}"
  		if !payment_date.nil?
  			return s1 + " (on #{self.payment_date.to_formatted_s(:short)})"
      else
        return s1
  		end
  	end
  end

  def display_date (date)
  	if date.nil?
  		'Nil'
  	else
  		date.to_formatted_s(:short)
  	end
  end
end
