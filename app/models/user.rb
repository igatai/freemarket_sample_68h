class User < ApplicationRecord

  has_one :address
  has_many :products
  has_many :purchases
  has_many :cards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :family_name,           presence: true, format: { with: /\A[一-龥]+\z/}
  validates :first_name,            presence: true, format: { with: /\A[一-龥]+\z/}
  validates :family_name_zenkaku,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_zenkaku,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :nickname,              presence: true
  validates :birthyear,             presence: true, numericality: true, length: { is: 4 } 
  validates :birthmonth,            presence: true, numericality: true, length: { in: 1..2 } 
  validates :birthday,              presence: true, numericality: true, length: { in: 1..2 } 
  validates :email,                 presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :password,              presence: true
  # validates :encrypted_password,    presence: true


end
