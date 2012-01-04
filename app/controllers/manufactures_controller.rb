class ManufacturesController < ApplicationController
  authorize_resource


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


    @manufacture.order_id = @order.id
    @manufacture.product_id = @order.product_id
    if @manufacture.save
      @order.processing

      orders = Order.by_manufacture_state("0", @manufacture.product.id)


      sum_manufacture_product = @order.product.manufactures.sum(:quantity)

      sum_manufacture_complete = Order.by_manufacture_state(1, @order.product.id).empty? ? 0 : Order.by_manufacture_state(1, @order.product.id).sum(:quantity)

      total_quantity = sum_manufacture_product - sum_manufacture_complete
      orders.each do |order|

        if order.quantity <= total_quantity
          order.manufacture_flag = 1
          order.save

          total_quantity -= order.quantity
        end

      end

      render "shared/close", :layout => 'fancybox'
    else

      render :action => "new", :layout => 'fancybox'
    end
  end


  def destroy
    @manufacture = Manufacture.find(params[:id])
    @order = Order.find(params[:order_id])

    delete_quantity = @manufacture.quantity
    orders = Order.by_manufacture_state_product_ordering(1, @manufacture.product.id).order("id DESC")


    @manufacture.destroy


    sum_manufacture_product = @order.product.manufactures.sum(:quantity)

    sum_manufacture_complete = Order.by_manufacture_state(1, @order.product.id).empty? ? 0 : Order.by_manufacture_state(1, @order.product.id).sum(:quantity)

    total_quantity = delete_quantity +  sum_manufacture_complete - sum_manufacture_product
    orders.each do |order|

      if order.quantity <= total_quantity
        order.manufacture_flag = 0
        order.save

        total_quantity -= order.quantity
      end

    end


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
