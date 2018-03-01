class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id  
end
