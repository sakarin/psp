class PumpLinesController < ApplicationController

  # GET /pump_lines
  # GET /pump_lines.xml
  def index
    @pump_lines = PumpLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pump_lines }
      format.js { render :json => @pump_lines }
    end
  end

  # GET /pump_lines/1
  # GET /pump_lines/1.xml
  def show
    @pump_line = PumpLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @pump_line }
    end
  end

  # GET /pump_lines/new
  # GET /pump_lines/new.xml
  def new
    @pump_line = PumpLine.new

   render :layout => "fancybox"
  end

  # GET /pump_lines/1/edit
  def edit
    @pump_line = PumpLine.find(params[:id])
    render :layout => "fancybox"
  end

  # POST /pump_lines
  # POST /pump_lines.xml
  def create
    @pump_line = PumpLine.new(params[:pump_line])
    if @pump_line.save
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "new"
    end
  end

  # PUT /pump_lines/1
  # PUT /pump_lines/1.xml
  def update
    @pump_line = PumpLine.find(params[:id])

    respond_to do |format|
      if @pump_line.update_attributes(params[:pump_line])
         format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @pump_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pump_lines/1
  # DELETE /pump_lines/1.xml
  def destroy
    @pump_line = PumpLine.find(params[:id])
    @pump_line.destroy

    respond_to do |format|
      format.html { redirect_to(pump_lines_url) }
      format.xml { head :ok }
    end
  end
end
