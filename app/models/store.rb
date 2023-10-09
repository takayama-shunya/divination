class Store < ApplicationRecord

  # リレーション
  has_many :favorite_stores
  has_many :users, through: :favorite_stores do
  end
end
