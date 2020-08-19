module ApplicationHelper
	def display_date_long(date)
		unless date.present?
			return 'Nil'
		end
		date.to_formatted_s(:long)
	end
	def display_date_short(date)
		unless date.present?
			return 'Nil'
		end
		date.to_formatted_s(:short)
	end
end
