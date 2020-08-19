class Room < ApplicationRecord
	has_many :hostel_entries
	has_many :users, through: :hostel_entries

	has_one_attached :cover_picture

	after_commit :add_default_cover, on: %i[create update]

	def display_cover_picture
	  self.cover_picture.variant(resize_and_pad: [250,250]).processed
	end

	private
	  def add_default_cover
	    unless cover_picture.attached?
	      cover_picture.attach(
	        io: File.open(
	          Rails.root.join(
	            'app', 'assets', 'images', 'default_room.png'
	            )
	          ),
	          filename: 'default_room.png',
	          content_type: 'image/png'
	        )
	    end
	  end
end
