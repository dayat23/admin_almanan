class Product < ActiveRecord::Base
  attr_accessible :category_id, :code_product, :name_product, :status, :stock, :price, :description, :photo_products_attributes

  belongs_to :category

  has_many :line_items
  has_many :review_products
  has_many :photo_products, :dependent => :destroy

  accepts_nested_attributes_for :photo_products, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :category_id, message: "Kategori tidak boleh kosong"
  validates_presence_of :name_product, message: "Nama produk tidak boleh kosong"
  validates_presence_of :stock, message: "Stok tidak boleh kosong"
  validates_presence_of :price, message: "Harga tidak boleh kosong"

  before_save :create_code_product

  def create_code_product
  	self.code_product ||= self.category.name[0] + rand(0..100**2).to_s
  end
end
