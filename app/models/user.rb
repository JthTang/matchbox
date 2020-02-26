class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :skills, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :skills, source: :bookings
  has_many :work_histories, dependent: :destroy

  validates :first_name, presence: true
  validates :second_name, presence: true
  # validates :city, presence: true
  # validates :bio, presence: true
end
