class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :order
  
  has_many :visits
end
