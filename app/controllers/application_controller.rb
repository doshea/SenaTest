class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  private
  def authenticate
    @current_user = User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
    @current_user ||= session[:user_id].present? ? User.find(session[:user_id]) : nil
  end

  def ensure_logged_in
    render text: 'Account Required' if @current_user.nil?
  end
  def ensure_admin
    render text: 'Not Authorized' if (@current_user.nil? || !@current_user.is_admin)
  end
end
