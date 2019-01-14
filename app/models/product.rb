class Product < ApplicationRecord
  has_many :orders

  validates_presence_of  :name, message: "Musisz podać nazwę produktu"
  validates_presence_of  :price, message: "Musisz podać cenę produktu"
  validates_presence_of  :days, message: "Musisz podać liczbę dni ważnosci produktu"
end
