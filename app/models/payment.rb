class Payment < ActiveRecord::Base
  attr_accessible :delay, :payer_id, :payment_date,
                  :product, :recipient_id, :status, :sum, :comment, :period_id, :cach, :items_attributes, :period, :count
  validates   :product, :sum, :recipient_id, :presence => true

  default_scope order('created_at desc')

  scope :departments, lambda {|department = nil| where('department = ?', department).order('created_at desc')}

	belongs_to :recipient
	belongs_to :payer
  belongs_to :user
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

end
