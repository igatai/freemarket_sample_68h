class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  mount_uploader :image, ImageUploader

  has_many :images
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  

end
