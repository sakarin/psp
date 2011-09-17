class ApplicationController < ActionController::Base
  protect_from_forgery

  #check_authorization

  before_filter :write_logger



   # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end

  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t("errors.access_denied")
    redirect_to :back
  end

  def write_logger
    unless self.controller_name == "logs" or self.controller_name == "sessions" or self.controller_name == "dashboard" or current_user.nil?
      Log.create(:user => current_user.name, :system => t("activerecord.models.#{self.controller_name.singularize}"), :action => t("actions.#{self.action_name}"), :ip => current_user.current_sign_in_ip)
    end

    if self.controller_name == "sessions" and self.action_name == "create"  and !current_user.nil?
      Log.create(:user => current_user.name, :system => t("activerecord.models.#{self.controller_name.singularize}"), :action => t("sessions.#{self.action_name}"), :ip => current_user.current_sign_in_ip)
    elsif self.controller_name == "sessions" and self.action_name == "destroy"  and !current_user.nil?
      Log.create(:user => current_user.name, :system => t("activerecord.models.#{self.controller_name.singularize}"), :action => t("sessions.#{self.action_name}"), :ip => current_user.current_sign_in_ip)

    end
  end

end
