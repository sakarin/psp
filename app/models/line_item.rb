class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :invoice_id, :order_id, :product_id, :seek_quantity


  belongs_to :invoice

  belongs_to :product
  belongs_to :order

  validates_presence_of :seek_quantity
  validates_numericality_of :seek_quantity

  scope :by_invoice, lambda { |order_id, product_id, factory_id|
    joins(:invoice).where("line_items.order_id = ? and line_items.product_id = ? and invoices.factory_id = ? and line_items.state = 0 ", order_id, product_id, factory_id)
  }


end
