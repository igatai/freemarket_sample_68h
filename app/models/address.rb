class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zipcode,           presence: true, format: {with: /\A\d{7}\z/}
  validates :city,              presence: true, format: {with: /\A[一-龥ぁ-ん]/ }
  validates :address,           presence: true 
  validates :building,          presence: true
  validates :prefecture_id,     presence: true

end

