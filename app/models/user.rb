class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :family_name,           presence: true
  validates :first_name,            presence: true
  validates :family_name_zenkaku,  presence: true
  validates :first_name_zenkaku,   presence: true
  validates :nickname,              presence: true
  validates :birthyear,             presence: true
  validates :birthmonth,            presence: true
  validates :birthday,              presence: true
  # validates :phone_number,          presence: true

end
