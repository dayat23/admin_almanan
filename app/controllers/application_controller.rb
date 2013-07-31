class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_admin_user!
  
  # before_filter :messages

  include ActionView::Helpers::DateHelper

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    redirect_to root_path, alert: exception.message
  end

  def messages
  	@messages = Contact.find(:all, conditions: { status: 1 })
  end
end
