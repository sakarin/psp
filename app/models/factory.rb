class Factory < ActiveRecord::Base

  has_many :invoices
  has_many :orders , :through => :factory_systems
  has_many :stocks


  validates_presence_of :name

  default_scope :order => 'created_at DESC'

  scope :by_product, lambda { |product_id|
    joins(" INNER JOIN invoices ON invoices.id = line_items.invoice_id").joins(" INNER JOIN line_items ON line_items.order_id = orders.id ").joins(" INNER JOIN products ON products.id = line_items.product_id").where(" products.id = ? ", product_id)
  }

  scope :by_product2, lambda { |product_id|
    joins(:invoices).joins(:line_items).joins(:product).where(" products.id = ? ", product_id)
  }

  def code_number
    if Factory.first != nil then
      "F%.4d" % (Factory.first.id + 1)
    else
      "F%.4d" % (1)
    end
  end



  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end
end
