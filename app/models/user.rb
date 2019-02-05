class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :tickets
  has_many  :visits
  has_one   :address
  has_many  :abilities
  has_many  :activities
  has_many  :activities_calendar
  has_many  :activities_attends
  has_many  :orders
  has_attached_file :image

  scope :trainers, -> { where(role: 'trener') }
  validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
end
