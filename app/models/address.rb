class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :phone_number,      format: {with: /\A\d{11}\z/} unless{validation_context: true}
  validates :zipcode,           presence: true, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/}
  validates :city,              presence: true, format: {with: /\A[一-龥ぁ-ん]/ }
  validates :address,           presence: true 
  
  validates :prefecture_id,     presence: true

end

