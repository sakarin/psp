class PumpsController < ApplicationController

  # GET /pumps
  # GET /pumps.xml
  def index
    @pumps = Pump.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pumps }
      format.js { render :json => @pumps }
    end
  end

  # GET /pumps/1
  # GET /pumps/1.xml
  def show
    @pump = Pump.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @pump }
    end
  end

  # GET /pumps/new
  # GET /pumps/new.xml
  def new
    @pump = Pump.new

    render :layout => "fancybox"
  end

  # GET /pumps/1/edit
  def edit
    @pump = Pump.find(params[:id])
    render :layout => "fancybox"
  end

  # POST /pumps
  # POST /pumps.xml
  def create
    @pump = Pump.new(params[:pump])

    if @pump.save
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "new"
    end

  end

  # PUT /pumps/1
  # PUT /pumps/1.xml
  def update
    @pump = Pump.find(params[:id])

    respond_to do |format|
      if @pump.update_attributes(params[:pump])
         format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @pump.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pumps/1
  # DELETE /pumps/1.xml
  def destroy
    @pump = Pump.find(params[:id])
    @pump.destroy

    respond_to do |format|
      format.html { redirect_to(pumps_url) }
      format.xml { head :ok }
    end
  end
end
