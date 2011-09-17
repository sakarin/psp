class CoatsController < ApplicationController

  def index
    @coats = Coat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @coats }
      format.js { render :json => @coats }
    end
  end

  def show
    @coat = Coat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @coat }
    end
  end


  def new
    @coat = Coat.new
    render :layout => "fancybox"
  end

  def edit
    @coat = Coat.find(params[:id])
    render :layout => "fancybox"
  end

  def create
    @coat = Coat.new(params[:coat])

    if @coat.save
      render :template => 'shared/close', :layout => "fancybox"
    else
      render :action => "new"
    end
  end

  def update
    @coat = Coat.find(params[:id])

    respond_to do |format|
      if @coat.update_attributes(params[:coat])
        format.html {render :template => 'shared/close', :layout => "fancybox"}
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @coat.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @coat = Coat.find(params[:id])
    @coat.destroy

    respond_to do |format|
      format.html { redirect_to(coats_url) }
      format.xml { head :ok }
    end
  end
end
