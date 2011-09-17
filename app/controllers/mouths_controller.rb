class MouthsController < ApplicationController

  def index
    @mouths = Mouth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @mouths }
      format.js { render :json => @mouths }
    end
  end

  # GET /mouths/1
  # GET /mouths/1.xml
  def show
    @mouth = Mouth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @mouth }
    end
  end

  # GET /mouths/new
  # GET /mouths/new.xml
  def new
    @mouth = Mouth.new
    render :layout => "fancybox"
  end

  # GET /mouths/1/edit
  def edit
    @mouth = Mouth.find(params[:id])
    render :layout => "fancybox"
  end

  # POST /mouths
  # POST /mouths.xml
  def create
    @mouth = Mouth.new(params[:mouth])

    if @mouth.save
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "new"
    end
  end

  # PUT /mouths/1
  # PUT /mouths/1.xml
  def update
    @mouth = Mouth.find(params[:id])

    respond_to do |format|
      if @mouth.update_attributes(params[:mouth])
       format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @mouth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mouths/1
  # DELETE /mouths/1.xml
  def destroy
    @mouth = Mouth.find(params[:id])
    @mouth.destroy

    respond_to do |format|
      format.html { redirect_to(mouths_url) }
      format.xml { head :ok }
    end
  end
end
