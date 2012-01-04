class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash.notice = t('order.update')
      redirect_to users_path
    else
      flash.notice = t('order_state.complete')
      render :action => "edit"
    end

   end

end
