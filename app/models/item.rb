class Item < ActiveRecord::Base
  attr_accessible :date, :payment_id, :status, :cach
	belongs_to :payment

  scope :accessory, lambda {|department = nil  | joins('left join `payments` on `payments`.`id` = `items`.`payment_id` ').
        where( department.nil? ? ''  : 'payments.department = ?', department) }
end
