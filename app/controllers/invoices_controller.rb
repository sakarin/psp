class InvoicesController < ApplicationController
  authorize_resource
  before_filter :load_orders


  def index
    @invoices = Invoice.all
    @factories = Factory.all
    #@orders = Order.find_all_by_manufacture_flag("0")
  end

  def new
    @invoice = Invoice.new
    @invoice.factory_id = params[:id]
    @factory = Factory.find(params[:id])
  end

  def create
    @invoice = Invoice.create(:number => Invoice.gen_number, :factory_id => params[:invoice][:factory_id])


    unless params[:invoice][:order_ids].nil?
      params[:invoice][:order_ids].each do |id|
        order = Order.find(id)

        line_item = LineItem.new(:invoice_id => @invoice.id, :order_id => id, :product_id => order.product_id,
                                 :seek_quantity => params[:invoice][:seek_quantity][id], :quantity => 0)
        if line_item.save
          order.manufactory
          flash.notice = t('invoice.save')
        end

      end


    end


    redirect_to edit_invoice_url(@invoice)
  end

  def edit
    @invoice = Invoice.find(params[:id])

  end

  def update
    @invoice = Invoice.find(params[:id])


    unless params[:invoice].nil?

      params[:invoice][:order_ids].each do |id|
        @line_item = LineItem.where("invoice_id = ? AND order_id = ?", @invoice.id, id).last

        if (params[:invoice][:quantity][id]).to_i <= @line_item.product.material
          difference = (params[:invoice][:quantity][id]).to_i - (@line_item.quantity).to_i

          @line_item.quantity = params[:invoice][:quantity][id]
          @line_item.save


          product = @line_item.order.product
          product.material -= difference
          product.save

          @invoice.print_factory

          flash.notice = t('invoice.update')
        else
          flash.alert = t('invoice.error')
        end
      end

    end


    redirect_to edit_invoice_url(@invoice)


  end

  def show
    @invoice = Invoice.find(params[:id])

    @invoice.check_sum

    render :layout => "report"
  end

  def print_factory
    @invoice = Invoice.find(params[:id])
    @invoice.complete
    render :layout => "report"
  end

  private

  def load_orders
    @orders = Order.all
  end
end