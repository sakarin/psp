class Invoice < ActiveRecord::Base
  #attr_accessible :line_items


  belongs_to :factory
  has_many :line_items

  #default_scope :order => 'created_at DESC'

  has_many :state_events, :as => :stateful

  scope :by_factory, lambda { |factory_id|
    joins(" INNER JOIN factory_systems ON invoices.id = factory_systems.invoice_id").
        where(" factory_systems.factory_id = ? ", factory_id)
  }

  # shipments state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'print_invoice', :use_transactions => false do

    event :check_sum do
      transition :from => 'print_invoice', :to => 'check_sum'
    end

    event :print_factory do
      transition :from => 'check_sum', :to => 'print_factory'
    end

    event :complete do
      transition :from => 'print_factory', :to => 'complete'
    end

    after_transition :to => 'complete', :do => :process_complete
  end

  def process_complete

  end




  def self.gen_number
    if Invoice.last != nil then
      "I%.4d" % (Invoice.last.id + 1)
    else
      "I%.4d" % (1)
    end
  end

end
