class DashboardController < ApplicationController
  before_filter :authenticate_user!


  def index
  end

  def menu
    render :layout => "devise"
  end

  def database
    render :layout => "devise"
  end

end
