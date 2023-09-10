class CreateFavoriteStores < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_stores do |t|
      t.references :user,           foreign_key: true
      t.references :store,          foreign_key: true
      t.timestamps
    end
  end
end
