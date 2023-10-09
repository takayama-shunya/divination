class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  
  # validates
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: { scope: :email }
  validates :nickname, presence: true, length: { maximum: 50 }, uniqueness: true
    # アルファベット、大文字アルファベット、数字が1文字ずつ含まれることを要求する正規表現
  validates :password, presence: true, length: { minimum: 8, maximum: 128 }, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: true

  # リレーション
  has_many :favorite_stores
  has_many :stores, through: :favorite_stores
  

end
