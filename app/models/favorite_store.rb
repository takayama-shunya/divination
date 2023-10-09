class FavoriteStore < ApplicationRecord
  # リレーション
  belongs_to :user
  belongs_to :store
end
