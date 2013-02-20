class Recipient < ActiveRecord::Base
  attr_accessible :address, :contacts, :name
  validates :name, :uniqueness => true
  has_many :payments
end
