class Order < ActiveRecord::Base
  attr_accessible :account_member_id, :status, :destination_id, :total_all_price, :cart_id, :total_all_price_dollar, :code_order

  belongs_to :account_member
  belongs_to :destination
  belongs_to :cart

  has_many :line_items
  has_many :transactions, :class_name => "OrderTransaction"

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end
