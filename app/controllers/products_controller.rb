class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search_type], params[:search], params[:page])


    respond_to do |format|
      format.html
      format.xml { render :xml => @products }
    end
  end

  def newmenu
      render :layout => 'fancybox'
  end

  def toolbar
    render :layout => 'fancybox'
  end

  def show
    @product = Product.find(params[:id])

    case @product.product_type
      when 1 then
        render "products/bag/show"
      when 2 then
        render "products/envelope/show"
      when 3 then
        render "products/box/show"
      else
        render "products/other/show"
    end


  end


  def new

    params[:product]
    params[:product_type]
    @product = Product.new
    @product.product_type = params[:product_type]
    @product.code = @product.code_number

    case @product.product_type.to_s
      when "1" then
        render "products/bag/new"
      when "2" then
        render "products/envelope/new"
      when "3" then
        render "products/box/new"
      else
        render "products/other/new"
    end

  end


  def edit
    @product = Product.find(params[:id])

    case @product.product_type
      when 1 then
        render "products/bag/edit"
      when 2 then
        render "products/envelope/edit"
      when 3 then
        render "products/box/edit"
      else
        render "products/other/edit"
    end
  end


  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to(products_path, :notice => t('product.save'))
    else
      #redirect_to "/products/new/#{params[:product][:product_type]}"
      #@product.product_type = params[:product_type]
      #redirect_to :action => "new"
    end

  end


  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to(products_path, :notice => t('product.update'))
    else
      redirect_to(edit_product_path(@product))
      #render :action => "edit"
    end

  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml { head :ok }
    end
  end
end
