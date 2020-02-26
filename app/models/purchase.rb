class Purchase < ApplicationRecord
  has_one :product
  belongs_to :user
end
