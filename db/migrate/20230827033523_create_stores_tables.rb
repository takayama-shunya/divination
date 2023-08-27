class CreateStoresTables < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name,               null: false, limit: 100
      t.references :company,        foreign_key: true
      t.references :prefecture,     foreign_key: true
      t.string :address,            limit: 100
      t.string :phone_number,       limit: 20
      t.string :business_hours,     limit: 50
      t.string :url_path,           limit: 100
      t.timestamps
    end
  end
end
