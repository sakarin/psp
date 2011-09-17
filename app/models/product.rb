class Product < ActiveRecord::Base
  attr_accessible :order
  attr_accessible :manufactures
  attr_accessible :product_type, :code, :customer_id, :name, :print_color, :pump_id, :pump_line_id, :paper, :thick, :cut_id, :width, :high, :side, :cut_unit, :coat_id, :mouth_id, :bottom, :ear
  attr_accessible :ear_number, :ear_long, :ear_unit, :comment, :size

  #after_save :update_manufacture_state
  #after_update :update_manufacture_state


  belongs_to :pump
  belongs_to :pump_line
  belongs_to :cut
  belongs_to :coat
  belongs_to :mouth
  belongs_to :glue
  belongs_to :customer

  has_many :orders
  has_many :manufactures
  has_many :stocks
  has_many :sents
  has_many :line_items

  validates_presence_of :name


  default_scope :order => 'created_at DESC'




  def code_number
    if Product.first != nil then
      "%.4d" % (Product.first.id + 1)
    else
      "%.4d" % (1)
    end
  end

  def self.search(search_type, search, page)
    if search_type == '1'
      paginate :per_page => 20, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
    else
      paginate :per_page => 20, :page => page,
               :conditions => ['customers.name like ?', "%#{search}%"],
               :joins => 'INNER JOIN customers ON products.customer_id = customers.id ',
               :order => 'customers.name'

    end
  end

end
