class Payment < ActiveRecord::Base
  attr_accessible :delay, :payer_id, :payment_date, :product, :recipient_id, :status, :sum, :comment, :period_id, :cach

  validates :payment_date,  :product, :sum, :recipient_id, :presence => true

	belongs_to :recipient
	belongs_to :payer
	belongs_to :period
end
