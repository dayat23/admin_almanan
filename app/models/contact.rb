class Contact < ActiveRecord::Base
  attr_accessible :email, :full_name, :message, :subject, :status

  def self.update_status(id)
  	@id = find(id)
  	@id.update_attribute :status, 2
  end
end
