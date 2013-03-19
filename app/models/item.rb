class Item < ActiveRecord::Base
  attr_accessible :date, :payment_id, :status, :cach
	belongs_to :payment
end
