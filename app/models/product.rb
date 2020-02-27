class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :payment
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :user

  
  validates :prefecture_id,           presence: true
  validates :category_id,             presence: true
  validates :price,                   presence: true
  validates :delivery_method,         presence: true
  validates :payment,                 presence: true
  validates :status,                  presence: true
  validates :condition,               presence: true
  validates :content,                 presence: true
  validates :name,                    presence: true
end
