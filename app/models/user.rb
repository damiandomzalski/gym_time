class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :tickets
  has_many  :visits
  has_one   :adress
  has_many  :ability
  has_many  :activities
  has_many  :activities_calendar
  has_many  :activities_attends

  scope :trainers, -> { where(profile: 'trener') }
end
