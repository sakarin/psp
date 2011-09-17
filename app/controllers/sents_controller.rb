class SentsController < ApplicationController

  before_filter :load_sents, :only => [:show]

  def index
    #@sents = Sent.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
    @orders = Order.search(params[:search_type], params[:search], params[:page], params[:search_state])
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def new
    @order = Order.find(params[:order_id])
    @sent = Sent.new
    @order.sending
    render :layout => 'fancybox'
  end

  def update

    @sent = Sent.new(params[:sent])
    @sent.order_id = params[:order_id]
    @order = Order.find(params[:order_id])
    @sent.product_id= @order.product_id

    if @sent.save
      @order.sending
      if @order.quantity <= @order.sents.sum(:quantity)
        @order.sent_flag=1

        @order.save
      end


      render "shared/close", :layout => 'fancybox'
    else
      #redirect_to new_order_sent_path(@order, @sent)
      render :action => "new", :layout => 'fancybox'
    end
  end

  #def create
  #
  #  @sent = Sent.new(params[:sent])
  #
  #  @sent.save
  #  respond_to do |format|
  #    format.js {}
  #  end
  #
  #end

  def destroy


    @sent = Sent.find(params[:id])
    @sent.destroy

    respond_to do |format|
      format.html { redirect_to(order_sent_url) }
      format.xml { head :ok }
    end
  end

  def load_sents
    @sents = Sent.where("order_id = ?", params[:order_id]).order(:created_at)
  end

  private

  def sort_column
    Sent.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
