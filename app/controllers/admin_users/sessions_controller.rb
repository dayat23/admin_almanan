class AdminUsers::SessionsController < Devise::SessionsController
  layout false
  skip_before_filter  :verify_authenticity_token
  # include ::SslRequirement
  # ssl_required :new, :create, :destroy
  
  def new
    super
    reset_session
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name) 
    
    if resource
      set_flash_message :notice, :signed_in 
      sign_in_and_redirect(resource_name, resource) 
    end
  end

  def destroy
    reset_session
    super
    reset_session
  end
end
