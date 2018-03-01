class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true

  has_many :products, dependent: :destroy
  has_many :solds, class_name: "Product", foreign_key: :seller_id
  has_many :purchases, class_name: "Product", foreign_key: :buyer_id 
end


# has_many :likes
# has_many :liked_posts, through: :likes, source: :post