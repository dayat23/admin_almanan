class AccountMember < ActiveRecord::Base
  attr_accessible :address, :city_id, :email, :encrypted_password, :first_name, 
  :last_name, :phone, :role_id, :salt, :state_id, :password, :password_confirmation

  attr_accessor :password

  belongs_to :role
  belongs_to :city
  belongs_to :state

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true,
                    length: { :minimum => 6, :maximum => 15, message: "Minimal 6 karakter dan maksimum 15 karakter" },
                    confirmation: true
  validates_presence_of :address, message: "tidak boleh kosong"
  # validates_presence_of :city_id, message: "Kota tidak boleh kosong"
  validates_presence_of :first_name, message: "tidak boleh kosong"
  validates_presence_of :phone, message: "tidak boleh kosong"
  # validates_presence_of :state_id, message: "Provinsi tidak boleh kosong"
  validates_presence_of :last_name, message: "tidak boleh kosong"
  validates_format_of :email, with: email_regex, message: "tidak valid"
  validates_presence_of :email, message: "tidak boleh kosong"
  validates_uniqueness_of :email, case_sensitive: false, message: "sudah digunakan"

  before_save :encrypt_password

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end


  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  private
  def encrypt_password
  	self.salt = make_salt if new_record?
  	self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
