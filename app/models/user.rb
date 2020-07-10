class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :mobile_number, presence: true, numericality: {only_integer: true}, length: {is: 10}
  has_one_attached :avatar
  has_many_attached :documents

  has_many :hostel_entries
  accepts_nested_attributes_for :hostel_entries

  has_many :rooms, through: :hostel_entries

  after_commit :add_default_avatar, on: %i[create update]



  def full_name
  	"#{first_name} #{last_name}" if first_name || last_name
  end

  def profile_picture
    self.avatar.variant(resize_and_pad: [300,300]).processed
  end

  private
    def add_default_avatar
      unless avatar.attached?
        avatar.attach(
          io: File.open(
            Rails.root.join(
              'app', 'assets', 'images', 'default_profile.jpg'
              )
            ),
            filename: 'default_profile.jpg',
            content_type: 'image/jpg'
          )
      end
    end
end
