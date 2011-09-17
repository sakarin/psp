class FactoriesController < ApplicationController

  # GET /factories
  # GET /factories.xml
  def index
    @factories = Factory.search(params[:search], params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @factories }
    end
  end

  # GET /factories/1
  # GET /factories/1.xml
  def show
    @factory = Factory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @factory }
    end
  end

  # GET /factories/new
  # GET /factories/new.xml
  def new
    @factory = Factory.new
    @factory.code = @factory.code_number

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @factory }
    end
  end

  # GET /factories/1/edit
  def edit
    @factory = Factory.find(params[:id])
    @orders = Order.by_factory(params[:id])
  end

  # POST /factories
  # POST /factories.xml
  def create
    @factory = Factory.new(params[:factory])

    if @factory.save
      redirect_to(factories_path, :notice => t('factory.update'))
    else
      render :action => "new"
    end

  end

  # PUT /factories/1
  # PUT /factories/1.xml
  def update
    @factory = Factory.find(params[:id])
    @orders = Order.by_factory(params[:id])
    if @factory.update_attributes(params[:factory])

      redirect_to(factories_path, :notice => t('factory.update'))
    else
      render :action => "edit"
    end

  end

  # DELETE /factories/1
  # DELETE /factories/1.xml
  def destroy
    @factory = Factory.find(params[:id])
    @factory.destroy

    respond_to do |format|
      format.html { redirect_to(factories_url) }
      format.xml { head :ok }
    end
  end
end
