class StocksController < ApplicationController

  before_filter :load_stocks , :only => [:show]

  def index
     @orders = Order.search(params[:search_type], params[:search], params[:page], params[:search_state])
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def new
     @order = Order.find(params[:order_id])
     @stock = Stock.new
     @factories = Factory.all
     render :layout => 'fancybox'
  end

  def update

    @stock = Stock.new(params[:stock])
    @stock.order_id = params[:order_id]
    @order = Order.find(params[:order_id])
    @stock.product_id= @order.product_id


    if @stock.save
      @stock.order.stocking

      stock_unit = Stock.where("order_id = ? and product_id = ? and factory_id = ?", @stock.order_id, @stock.product_id, @stock.factory_id)
      line_item = LineItem.by_invoice(@stock.order_id, @stock.product_id, @stock.factory_id).first
      line = LineItem.find(line_item.id)

      if (stock_unit.sum(:quantity) >= line_item.quantity)
        line.state = 1
        line.save
      end

      if @order.quantity <= @order.stocks.sum(:quantity)
        @order.stock_flag=1
        @order.save
      end

      #if @stock

      render "shared/close", :layout => 'fancybox'
    else



      render :action => "new" , :layout => 'fancybox'
    end
  end



  def destroy


    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to(order_stock_url) }
      format.xml  { head :ok }
    end
  end

  def load_stocks
    @stocks = Stock.where("order_id = ?", params[:order_id]).order(:created_at)
  end

   private



  def sort_column
    Stock.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
