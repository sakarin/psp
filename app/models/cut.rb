class Cut < ActiveRecord::Base
  has_one :product
  validates_presence_of :name
end
