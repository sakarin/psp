class ManufacturesController < ApplicationController


  before_filter :load_manufactures, :only => [:show]

  def index
    @orders = Order.search(params[:search_type], params[:search], params[:page], params[:search_state])

  end

  def show
    @order = Order.find(params[:order_id])


  end


  def new
    @order = Order.find(params[:order_id])
    @manufacture = Manufacture.new
    render :layout => 'fancybox'
  end

  def update

    @manufacture = Manufacture.new(params[:manufacture])
    @order = Order.find(params[:order_id])
    @order.save

    @manufacture.order_id = @order.id
    @manufacture.product_id = @order.product_id
    if @manufacture.save

      orders = Order.by_manufacture_state("0", @manufacture.product.id)

      sum_meterial_manufacutured = @manufacture.product.manufactures.sum(:quantity)
      orders.each do |order|

        break if order.quantity > (sum_meterial_manufacutured - Order.by_manufacture_state("1", @manufacture.product.id).sum(:quantity))

        order.manufacture_flag = 1
        order.processing
        order.save

      end

      @order.processing
      render "shared/close", :layout => 'fancybox'
    else

      render :action => "new", :layout => 'fancybox'
    end
  end


  def destroy
    @manufacture = Manufacture.find(params[:id])
    @manufacture.destroy

    respond_to do |format|
      format.html { redirect_to(order_manufacture_path(params[:order_id], 1)) }
      format.xml { head :ok }
    end
  end


  private

  def load_manufactures
    @manufactures = Manufacture.where("order_id = ?", params[:order_id]).order(:created_at)
  end

  def sort_column
    Manufacture.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def update_state
    if (self.product.manufactures.sum(:quantity) + self.product.material) >= self.order.quantity
      self.complete
    else
      self.uncomplete
    end
  end

end
