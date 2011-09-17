class Manufacture < ActiveRecord::Base

  after_save :increase_material
  after_destroy :decrement_meterial


  belongs_to :order
  belongs_to :product

  validates_numericality_of :quantity

  def increase_material
    product = self.order.product
    product.material += self.quantity
    product.save

    #orders = Order.by_manufacture_state("0", product.id)
    #
    #sum_meterial_manufacutured = self.product.manufactures.sum(:quantity)
    #orders.each do |order|
    #
    #  break if order.quantity > (sum_meterial_manufacutured - Order.by_order_complete(order.id).sum(:quantity))
    #
    #  order.manufacture_flag = 1
    #  order.processing
    #  order.save
    #
    #end
  end

  def decrement_meterial
    product = self.order.product
    product.material -= self.quantity
    product.save

    orders = Order.by_manufacture_state("1", product.id)

    sum_meterial_manufacutured = self.product.manufactures.sum(:quantity)
    orders.each do |order|
      if order.quantity <= (sum_meterial_manufacutured - Order.by_order_complete(order.id).sum(:quantity))
        order.manufacture_flag= "1"
        order.processing
        order.save
      else
        order.manufacture_flag= "0"

        order.save
      end
    end
  end


  def self.search(search_type, search, page)
    if search_type == '1'
      paginate :per_page => 20, :page => page,
               :conditions => ['orders.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON manufactures.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
               :order => 'orders.created_at DESC'
    elsif search_type == '2'
      paginate :per_page => 20, :page => page,
               :conditions => ['products.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON manufactures.order_id = orders.id INNER JOIN products ON orders.product_id = products.id ',
               :order => 'orders.created_at DESC'
    else
      paginate :per_page => 20, :page => page,
               :conditions => ['customers.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN orders ON manufactures.order_id = orders.id INNER JOIN customers ON orders.customer_id = customers.id ',
               :order => 'orders.created_at DESC'

    end
  end


end
