class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zipcode,           presence: true
  validates :city,              presence: true
  validates :address,           presence: true
  validates :building,          presence: true
  # validates :user_id,           presence: true
  validates :prefecture_id,     presence: true

end
