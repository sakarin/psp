class Sent < ActiveRecord::Base

  after_save :decrease_quantity

  belongs_to :order
  belongs_to :product

  after_save :decision_order_state
  #after_update :decision_order_state

  #default_scope :order => 'created_at DESC'

  validates_presence_of :quantity
  validates_numericality_of :quantity

  def decrease_quantity
    product = self.order.product
    product.quantity -= self.quantity
    product.save
  end


  def decision_order_state
    @order = Order.find(self.order_id)

    if @order.sents.sum(:quantity) >= @order.quantity
       @order.complete
    end
  end


  def self.search(search_type, search, page)
    if search_type == '1'
      paginate :per_page => 20, :page => page,
               :conditions => ['orders.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON sents.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
                :order => 'orders.created_at DESC'
    elsif search_type == '2'
      paginate :per_page => 20, :page => page,
               :conditions => ['products.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON sents.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
                :order => 'orders.created_at DESC'
    else
      paginate :per_page => 20, :page => page,
               :conditions => ['customers.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON sents.order_id = orders.id INNER JOIN customers ON orders.customer_id = customers.id ',
                :order => 'orders.created_at DESC'

    end
  end
end
