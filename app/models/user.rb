class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets
  has_many :visits
  has_one :adress
  has_one :ability
  has_many :activities
  has_many :activities_calendar
  has_many  :activities_attends	
end
