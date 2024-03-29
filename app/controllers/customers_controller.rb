class CustomersController < ApplicationController

  def index

    @customers = Customer.search(params[:search], params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new
    @customer.code = @customer.code_number

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @customer }
    end
  end

  def new_fancy
    @customer = Customer.new
    @customer.code = @customer.code_number
    render :layout => "fancybox"
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    if params[:customer_fancy] == "true"
      if @customer.save
       render "shared/close", :layout => 'fancybox'
      else
        render :action => "new", :layout => 'fancybox'
      end

    end


    if @customer.save
      redirect_to(customers_path, :notice => t('customer.update'))
    else
      render :action => "new"
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(params[:customer])
      redirect_to(customers_path, :notice => t('customer.update'))
    else
      render :action => "edit"
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml { head :ok }
    end
  end
end
