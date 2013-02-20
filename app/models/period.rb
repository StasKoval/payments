class Period < ActiveRecord::Base
  attr_accessible :value, :title

	has_many :payments
end
