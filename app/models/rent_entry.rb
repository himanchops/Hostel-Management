class RentEntry < ApplicationRecord
  belongs_to :hostel_entry #INVERSE
  default_scope -> { order(to_date: :desc, from_date: :desc) }

  validates :from_date, presence: true
  validates :rent, presence: true, numericality: {only_integer: true}
  
  before_create :fill_details
  after_create :add_total_rent_due
  
  before_update :update_total_rent_due
  before_destroy :delete_total_rent_due

  def payment
  	s1 = "Paid: #{self.amount_paid}, Bal: #{self.balance}"
  	if payment_date.nil?
      return s1
    else
  		return s1 + " (on #{self.payment_date.to_formatted_s(:short)})"
  	end
  end

  private
    def fill_details
      unless amount_paid.present?
        self.amount_paid = 0
      end
      self.balance = self.rent - self.amount_paid
    end

    def add_total_rent_due
      value = self.hostel_entry.total_rent_due + self.balance
      self.hostel_entry.update(total_rent_due: value)
    end

    def delete_total_rent_due
      value = self.hostel_entry.total_rent_due - self.balance
      self.hostel_entry.update(total_rent_due: value)
    end

    def update_total_rent_due
      original_balance = self.balance
      self.balance = self.rent - self.amount_paid

      value = self.hostel_entry.total_rent_due - original_balance + self.balance
      self.hostel_entry.update(total_rent_due: value)
    end
end
