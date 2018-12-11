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
  
  scope :trainers, -> { where(role: 'trener') }
end
