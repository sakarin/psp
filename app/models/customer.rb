class Customer < ActiveRecord::Base

  has_many :products
  has_many :orders

  default_scope :order => 'created_at DESC'

  validates_presence_of :name

  def code_number
    if Customer.first != nil then
      "%.4d" % (Customer.first.id + 1)
    else
      "%.4d" % (1)
    end  
  end

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end
end
