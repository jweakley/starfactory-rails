class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :error, :notice
  before_filter :add_breadcrumbs

private
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    error = I18n.t "pundit.#{policy_name}.#{exception.query}", default: ''
    flash[:error] = error unless error.blank?
    render 'static/status403'
  end

  def add_breadcrumbs
    add_breadcrumb 'Starfactory', :root_url
    if logged_in? && current_user.admin? &&
      ['new', 'create', 'edit', 'update', 'destroy'].include?(params[:action])
      add_breadcrumb 'Admin', :admin_url
    end
  end
end
