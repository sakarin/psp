class Stock < ActiveRecord::Base

  after_save :increase_quantity

  belongs_to :order
  belongs_to :product
  belongs_to :factory

  validates_presence_of :quantity
  validates_numericality_of :quantity

  def increase_quantity
    product = self.order.product
    product.quantity += self.quantity
    product.save
  end




  def self.search(search_type, search, page)
    if search_type == '1'
      paginate :per_page => 20, :page => page,
               :conditions => ['orders.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON stocks.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
                :order => 'orders.created_at DESC'
    elsif search_type == '2'
      paginate :per_page => 20, :page => page,
               :conditions => ['products.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON stocks.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
                :order => 'orders.created_at DESC'
    else
      paginate :per_page => 20, :page => page,
               :conditions => ['customers.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON stocks.order_id = orders.id INNER JOIN customers ON orders.customer_id = customers.id ',
                :order => 'orders.created_at DESC'

    end
  end
end
