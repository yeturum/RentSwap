class Listing < ActiveRecord::Base

belongs_to :users , :class_name => "User", :foreign_key => "users_id"

validates :city, :presence => true
validates :address, :presence => true
validates :rent_dates, :numericality => { :onlyinteger => true }
validates :rent_amount, :numericality => { :onlyinteger => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 98700248592 }
# details - no rules

end
