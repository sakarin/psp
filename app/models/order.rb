class Order < ActiveRecord::Base
  attr_accessible :number, :user_id, :customer_id, :product_id, :quantity, :note, :start_date, :end_date
  attr_accessible :manufactures





  belongs_to :user
  belongs_to :product
  belongs_to :customer


  has_many :line_items

  has_many :stocks

  has_many :sents

  has_many :factories, :through => :factory_systems

  has_many :manufactures


  has_many :state_events, :as => :stateful



  validates_presence_of :quantity
  validates_numericality_of :quantity
  validates_presence_of :product_id
  validates_presence_of :customer_id

  scope :by_factory, lambda { |factory_id|
    joins(" INNER JOIN line_items ON line_items.order_id = orders.id ").joins(" INNER JOIN invoices ON invoices.id = line_items.invoice_id").joins(" INNER JOIN factories ON factories.id = invoices.factory_id").where(" factories.id = ? ", factory_id)
  }

  scope :by_manufacture_state, lambda { |flag, product_id|
    where("manufacture_flag = ? AND product_id = ?", flag, product_id)
  }

  scope :by_manufacture_complete, lambda {
    where("manufacture_flag = 1")
  }

  scope :by_order_complete, lambda { |order_id|
    where("id = ? AND manufacture_flag = 1", order_id)
  }





  # shipments state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'ordering', :use_transactions => false do

    event :processing do
      transition :from => 'ordering', :to => 'processing'
    end

    event :manufactory do
      transition :from => 'processing', :to => 'manufactory'
    end

    event :stocking do
      transition :from => 'manufactory', :to => 'stocking'
    end

    event :sending do
      transition :from => 'stocking', :to => 'sending'
    end

    event :complete do
      transition :from => 'sending', :to => 'complete'
    end

    after_transition :to => 'complete', :do => :process_complete
  end


  private

  def process_complete

  end


  def self.search(search_type, search, page, search_state)
    case search_state
      when "1"
        state = " state IN ('ordering', 'processing', 'manufactory', 'stocking', 'sending') "
      when "2"
        state = " state like '%complete%'"
      when "3"
        state = " state like '%%' "
      else
        state = " state IN ('ordering', 'processing', 'manufactory', 'stocking', 'sending') "
    end


    if search_type == '1'
      paginate :per_page => 20, :page => page, :conditions => ["number like ? AND #{state}", "%#{search}%"], :order => 'number'
    elsif search_type == '2'
      paginate :per_page => 20, :page => page,
               :conditions => ["products.name like ? AND #{state}", "%#{search}%"],
               :joins => 'INNER JOIN products ON orders.product_id = products.id ',
               :order => 'orders.created_at DESC'
    else
      paginate :per_page => 20, :page => page,
               :conditions => ["customers.name like ? AND #{state}", "%#{search}%"],
               :joins => 'INNER JOIN customers ON orders.customer_id = customers.id ',
               :order => 'orders.created_at DESC'

    end
  end

  def self.gen_number
    if Order.last != nil then
      "R%.4d" % (Order.last.id + 1)
    else
      "R%.4d" % (1)
    end
  end

end
