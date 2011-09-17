class GluesController < ApplicationController

  def index
    @glues = Glue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @glues }
      format.js { render :json => @glues }
    end
  end

  # GET /glues/1
  # GET /glues/1.xml
  def show
    @glue = Glue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @glue }
    end
  end

  # GET /glues/new
  # GET /glues/new.xml
  def new
    @glue = Glue.new

    render :layout => "fancybox"
  end

  # GET /glues/1/edit
  def edit
    @glue = Glue.find(params[:id])
    render :layout => "fancybox"
  end

  # POST /glues
  # POST /glues.xml
  def create
    @glue = Glue.new(params[:glue])

    if @glue.save
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "new"
    end
  end

  # PUT /glues/1
  # PUT /glues/1.xml
  def update
    @glue = Glue.find(params[:id])


    if @glue.update_attributes(params[:glue])
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "edit"
    end

  end

  # DELETE /glues/1
  # DELETE /glues/1.xml
  def destroy
    @glue = Glue.find(params[:id])
    @glue.destroy

    respond_to do |format|
      format.html { redirect_to(glues_url) }
      format.xml { head :ok }
    end
  end
end
