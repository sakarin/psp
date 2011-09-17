class CutsController < ApplicationController


  # GET /cuts
  # GET /cuts.xml
  def index
    @cuts = Cut.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @cuts }
      format.js { render :json => @cuts }
    end
  end

  # GET /cuts/1
  # GET /cuts/1.xml
  def show
    @cut = Cut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @cut }
    end
  end

  # GET /cuts/new
  # GET /cuts/new.xml
  def new
    @cut = Cut.new


    render :layout => "fancybox"

  end

  # GET /cuts/1/edit
  def edit
    @cut = Cut.find(params[:id])
    render :layout => "fancybox"
  end

  # POST /cuts
  # POST /cuts.xml
  def create
    @cut = Cut.new(params[:cut])

    respond_to do |format|
      #format.html # new.html.erb
      #format.xml { render :xml => @cut }
      if @cut.save
        format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.js
      else
        render :action => "new"
      end
    end


  end

  # PUT /cuts/1
  # PUT /cuts/1.xml
  def update
    @cut = Cut.find(params[:id])

    respond_to do |format|
      if @cut.update_attributes(params[:cut])
        format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @cut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cuts/1
  # DELETE /cuts/1.xml
  def destroy
    @cut = Cut.find(params[:id])
    @cut.destroy

    respond_to do |format|
      format.html { redirect_to(cuts_url) }
      format.xml { head :ok }
    end
  end
end
