class OrdersController < ApplicationController
  authorize_resource

  helper_method :sort_column, :sort_direction


  def index

    @orders = Order.search(params[:search_type], params[:search], params[:page], params[:search_state])

  end


  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @order.number= Order.gen_number
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    if @order.save


      orders = Order.by_manufacture_state("0", @order.product_id)

      sum_meterial_manufacutured = @order.product.manufactures.sum(:quantity)
      orders.each do |order|

        break if order.quantity > (sum_meterial_manufacutured - Order.by_manufacture_state("1", order.product.id).sum(:quantity))

        order.manufacture_flag = 1
        order.processing
        order.save

      end

      flash.notice = t('order.save')
      redirect_to orders_path
    else
      render :action => "new"
    end

  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      #update_manufacture_flag
      flash.notice = t('order.update')
      redirect_to orders_path
    else
      render :action => "edit"
    end

  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml { head :ok }
    end
  end

  def update_product
    @products = Product.find(:all, :conditions => [" customer_id = ?", params[:id]]).sort_by { |k| k['name'] }
    respond_to do |format|
      format.json { render :json => @products }
    end
  end


  private


  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : "number"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
